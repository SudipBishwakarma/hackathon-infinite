import re
import asyncio
from typing import AsyncGenerator, List, Dict
from langchain_core.exceptions import OutputParserException
from langchain_core.messages import AIMessage, HumanMessage
from prompt.templates import template
from chain.chains import guardrail_chain, feature_extractor_chain, auditor_chain, fixer_chain
from utils.config import Config
from utils.logger import Logger
from utils.db_utils import RoleEnum
from rag.vector_store import format_context


config = Config()
logger = Logger.get_logger(name=config.app_name, level=config.log_level)

def regex_extract(sql: str) -> list[dict]:
    tables = re.findall(r'(?:FROM|INTO|TABLE)\s+([A-Za-z0-9_]+)', sql, re.IGNORECASE)
    cols   = re.findall(r'([A-Za-z0-9_]+)\s+(?:NUMBER|VARCHAR2|DATE)', sql, re.IGNORECASE)
    return [
        {"table_name": t, "columns": list(set(cols)), "client_name": ""}
        for t in set(tables)
    ]

def format_history(history: list[dict]) -> list[AIMessage | HumanMessage]:
    """Format the chat history to Langchain message objects."""
    formatted_history = []
    for message in history:
        if not message['message']:
            message['message'] = ""

        if message['role'] == RoleEnum.user:
            formatted_history.append(HumanMessage(content=message['message']))
        elif message['role'] == RoleEnum.assistant:
            formatted_history.append(AIMessage(content=message['message']))
    return formatted_history

def start_chat(question: str, history: list[dict]) -> tuple:
    """Main function to handle the chat interaction."""
    logger.debug(f"***Received question:\n{question}")
    chat_history = format_history(history)
    try:
        try:
            ai_message_guardrail: dict = guardrail_chain.invoke({"history": chat_history, "question": question})
            guardrail_prompt = template["guardrail"].invoke({"history": chat_history, "question": question}).to_string()
            logger.debug(f"***Guardrail Prompt:\n{guardrail_prompt}")
            logger.debug(f"***Guardrail AI Message:\n{ai_message_guardrail}")
            if not ai_message_guardrail.get("valid_input"):
                logger.warning("Invalid input detected by guardrail chain.")
                return ai_message_guardrail.get("markdown"), None
        except Exception as e:
            logger.error(f"Guardrail chain failed: {e}")
            return "Something happened. Please try again.", None

        try:
            ai_message_feature_extractor: dict = feature_extractor_chain.invoke({"history": chat_history, "question": question})
            feature_extractor_prompt = template["feature_extractor"].invoke({"history": chat_history, "question": question}).to_string()
            logger.debug(f"***Feature Extractor Prompt:\n{feature_extractor_prompt}")
            logger.debug(f"***Feature Extractor AI Message:\n{ai_message_feature_extractor}")
        except Exception as e:
            logger.error(f"Feature extractor chain failed: {e}")
            ai_message_feature_extractor = {}

        if ai_message_feature_extractor:
            features = ai_message_feature_extractor.get("tables", [])
        else:
            features = regex_extract(question)
            logger.debug(f"***Feature Extractor Regex Fallback:\n{features}")

        # RAG Implementation: Fetch context based on features from vector db
        context = template["context"].invoke({"knowledgebase": format_context(features)})
        logger.debug(f"***Context:\n{context.to_string()}")

        ai_message_auditor = auditor_chain.invoke({"history": chat_history, "context": context, "question": question})
        auditor_prompt = template["auditor"].invoke({"history": chat_history, "context": context, "question": question}).to_string()
        logger.debug(f"***Auditor Prompt:\n{auditor_prompt}")
        logger.debug(f"***Auditor AI Message:\n{ai_message_auditor}")
        if not ai_message_auditor.get("issues_found"):
            chat_history.extend([HumanMessage(content=question), AIMessage(content=ai_message_auditor.get("markdown", ""))])
            return (
                f'{ai_message_feature_extractor.get("markdown")}\n{ai_message_auditor.get("markdown", "")}',
                ai_message_auditor.get("markdown", "")
            )

        ai_message_fixer = fixer_chain.invoke({"history": chat_history, "audit": ai_message_auditor, "context": context, "question": question})
        fixer_prompt = template["fixer"].invoke({"history": chat_history, "audit": ai_message_auditor, "context": context, "question": question}).to_string()
        logger.debug(f"***Fixer Prompt:\n{fixer_prompt}")
        logger.debug(f"***Fixer AI Message:\n{ai_message_fixer}")
        chat_history.extend([HumanMessage(content=question), AIMessage(content=ai_message_fixer.get("markdown", ""))])
        return (
            f'{ai_message_feature_extractor.get("markdown")}\n{ai_message_auditor.get("markdown", "")}\n{ai_message_fixer.get("markdown", "")}',
            ai_message_fixer.get("markdown", "")
        )
    except OutputParserException as e:
        logger.error(f"Output parsing failed: {e}") 
        return "Please provide the PL/SQL script that needs to be reviewed and fixed.", None


async def start_chat_stream(question: str, history: List[Dict]) -> AsyncGenerator[str, None]:
    chat_history = format_history(history)

    try:
        # Guardrail
        try:            
            ai_message_guardrail: dict = guardrail_chain.invoke({"history": chat_history, "question": question})
            guardrail_prompt = template["guardrail"].invoke({"history": chat_history, "question": question}).to_string()
            logger.debug(f"***Guardrail Prompt:\n{guardrail_prompt}")
            logger.debug(f"***Guardrail AI Message:\n{ai_message_guardrail}")
            yield "\n"
            if not ai_message_guardrail.get("valid_input"):
                logger.warning("Invalid input detected by guardrail chain.")
                yield ai_message_guardrail.get("markdown", "Input rejected by guardrails.")
                return
        except Exception as e:
            logger.error(f"Guardrail chain failed: {e}")
            yield "Something happened. Please try again."
            return

        # Feature Extractor
        try:
            ai_message_feature_extractor: dict = feature_extractor_chain.invoke({"history": chat_history, "question": question})
            feature_extractor_prompt = template["feature_extractor"].invoke({"history": chat_history, "question": question}).to_string()
            logger.debug(f"***Feature Extractor Prompt:\n{feature_extractor_prompt}")
            logger.debug(f"***Feature Extractor AI Message:\n{ai_message_feature_extractor}")
            feature_markdown = ai_message_feature_extractor.get("markdown", "")
            yield "\n"
            for word in feature_markdown:
                yield word
                await asyncio.sleep(0.005)
        except Exception as e:
            logger.error(f"Feature extractor chain failed: {e}")
            ai_message_feature_extractor = {}

        # Context
        if ai_message_feature_extractor:
            features = ai_message_feature_extractor.get("tables")
        else:
            features = regex_extract(question)
            logger.debug(f"***Feature Extractor Regex Fallback:\n{features}")

        # RAG Implementation: Fetch context based on features from vector db
        context = template["context"].invoke({"knowledgebase": format_context(features)})
        logger.debug(f"***Context:\n{context.to_string()}")

        # Auditor
        ai_message_auditor = auditor_chain.invoke({
            "history": chat_history,
            "context": context,
            "question": question
        })
        auditor_prompt = template["auditor"].invoke({"history": chat_history, "context": context, "question": question}).to_string()
        logger.debug(f"***Auditor Prompt:\n{auditor_prompt}")
        logger.debug(f"***Auditor AI Message:\n{ai_message_auditor}")

        auditor_markdown = ai_message_auditor.get("markdown", "")
        yield "\n"
        for word in auditor_markdown:
            yield word
            await asyncio.sleep(0.005)

        if not ai_message_auditor.get("issues_found"):
            return

        # Fixer
        ai_message_fixer = fixer_chain.invoke({
            "history": chat_history,
            "audit": ai_message_auditor,
            "context": context,
            "question": question
        })
        fixer_prompt = template["fixer"].invoke({"history": chat_history, "audit": ai_message_auditor, "context": context, "question": question}).to_string()
        logger.debug(f"***Fixer Prompt:\n{fixer_prompt}")
        logger.debug(f"***Fixer AI Message:\n{ai_message_fixer}")
        chat_history.extend([HumanMessage(content=question), AIMessage(content=ai_message_fixer.get("markdown", ""))])

        fixer_markdown = ai_message_fixer.get("markdown", "")
        yield "\n"
        for word in fixer_markdown:
            yield word
            await asyncio.sleep(0.005)

    except Exception as e:
        logger.error(f"Streaming chat failed: {e}")
        yield "An error occurred while processing your request."
