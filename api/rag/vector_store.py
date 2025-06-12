from pinecone import Pinecone, ServerlessSpec
from langchain_pinecone import PineconeVectorStore

from utils.model import embed_model
from utils.config import Config


config = Config()

pc = Pinecone(api_key=config.pinecone_api_key)
index_name = config.pinecone_index_name
if not pc.has_index(index_name):
    pc.create_index(
        name=index_name,
        dimension=1536,
        metric="cosine",
        spec=ServerlessSpec(cloud="aws", region="us-east-1"),
    )

index = pc.Index(index_name)

vector_store = PineconeVectorStore(index=index, embedding=embed_model)

# Querying
def fetch_from_vector_store(features: dict) -> dict:
    """Fetches data from the vector store based on the provided features."""
    results = vector_store.similarity_search(
        features.get("table_name") + ", " + ", ".join(features.get("columns")),
        # list of a table name and columns - comma separated
        k=len(features.get("columns")) + 1,  # this should be len of the list - feature extracted
        filter={"table_name": features.get("table_name"), "client_name": features.get("client_name")}
    )

    data = {"ddl": "", "dd": [], "table_name": ""}
    for doc in results:
        if doc.metadata["file_name"].endswith(".sql"):
            data["ddl"] = doc.page_content.strip()
        else:
            data["dd"].append(doc.page_content)
        data["table_name"] = doc.metadata["table_name"]
    data["dd"] = "\n\n".join(data["dd"])
    return data

def format_context(features: dict) -> str:
    """Formats the fetched data into a context string."""
    # Prepare data from vector store
    list_data = []
    for feature in features:
        list_data.append(fetch_from_vector_store(feature))

    context = ""
    for item in list_data:
        context += f'Table {item["table_name"]} DDL: ```\n{item["ddl"]}\n```\n\nTable {item["table_name"]} Data Dictionary: ```\n{item["dd"]}\n```\n\n'

    return context.strip()
