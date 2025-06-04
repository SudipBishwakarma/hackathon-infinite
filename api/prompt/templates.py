from langchain_core.prompts import ChatPromptTemplate, PromptTemplate, MessagesPlaceholder
from .prompts import guardrail_system_prompt, feature_extract_system_prompt, context_prompt, audit_system_prompt, fix_system_prompt

template = {
    "guardrail": ChatPromptTemplate.from_messages(
        [("system", guardrail_system_prompt), MessagesPlaceholder(variable_name="history"), ("human", "{question}")]
    ),
    "feature_extractor": ChatPromptTemplate.from_messages(
        [("system", feature_extract_system_prompt), MessagesPlaceholder(variable_name="history"), ("human", "{question}")]
    ),
    "context": PromptTemplate.from_template(
        context_prompt
    ),
    "auditor": ChatPromptTemplate.from_messages(
        [("system", audit_system_prompt), MessagesPlaceholder(variable_name="history"), ("human", "Context: {context}"), ("human", "{question}")]
    ),
    "fixer": ChatPromptTemplate.from_messages(
        [("system", fix_system_prompt), MessagesPlaceholder(variable_name="history"), ("assistant", "Auditor: {audit}"), ("human", "Context: {context}"), ("human", "{question}")]
    )
}
