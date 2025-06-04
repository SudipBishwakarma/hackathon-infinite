from langchain_openai import AzureChatOpenAI, AzureOpenAIEmbeddings
from utils.config import Config

config = Config()

llm = AzureChatOpenAI(
    azure_endpoint=config.azure_endpoint,
    openai_api_key=config.azure_api_key,
    openai_api_version=config.azure_api_version,
    azure_deployment=config.azure_deployment_name,
    temperature=0
)

embed_model = AzureOpenAIEmbeddings(
    azure_endpoint=config.azure_embed_endpoint,
    openai_api_key=config.azure_embed_api_key,
    openai_api_version=config.azure_embed_api_version,
    azure_deployment=config.azure_embed_deployment_name
)
