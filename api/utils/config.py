import os
from dotenv import load_dotenv


class Config:
    """Configuration class for the PL/SQL Auditor Chatbot."""
    _instance = None

    def __new__(cls, *args, **kwargs):
        if not cls._instance:
            cls._instance = super(Config, cls).__new__(cls)
        return cls._instance

    def __init__(self):
        if not hasattr(self, "_initialized"):
            load_dotenv()  # Load environment variables from .env file

            self.azure_endpoint = os.getenv("AZURE_OPENAI_ENDPOINT")
            self.azure_api_key = os.getenv("AZURE_OPENAI_API_KEY")
            self.azure_api_version = os.getenv("AZURE_OPENAI_API_VERSION")
            self.azure_deployment_name = os.getenv("AZURE_OPENAI_DEPLOYMENT_NAME")
            self.azure_embed_endpoint = os.getenv("AZURE_OPENAI_EMBEDDING_ENDPOINT")
            self.azure_embed_api_key = os.getenv("AZURE_OPENAI_EMBEDDING_API_KEY")
            self.azure_embed_api_version = os.getenv("AZURE_OPENAI_EMBEDDING_API_VERSION")
            self.azure_embed_deployment_name = os.getenv("AZURE_OPENAI_EMBEDDING_DEPLOYMENT_NAME")
            self.pinecone_api_key = os.getenv("PINECONE_API_KEY")
            self.pinecone_index_name = os.getenv("PINECONE_INDEX_NAME")
            self.database_url = os.getenv("DATABASE_URL")
            self.table_name = os.getenv("TABLE_NAME")
            self.app_name = os.getenv("APP_NAME")
            self.log_level = os.getenv("LOG_LEVEL", "INFO")

            self._initialized = True
