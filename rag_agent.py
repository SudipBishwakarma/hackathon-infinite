import os
from dotenv import load_dotenv
from langchain_cohere import CohereEmbeddings
from langchain_community.vectorstores import FAISS
from langchain_community.document_loaders import TextLoader, PyMuPDFLoader
from langchain.text_splitter import RecursiveCharacterTextSplitter
from openai import AzureOpenAI

load_dotenv()

# Configuration
DATA_FOLDER = "data"
EMBEDDING_MODEL = "embed-english-v3.0"
COHERE_API_KEY = os.getenv("COHERE_API_KEY")
AZURE_API_KEY = os.getenv("AZURE_OPENAI_API_KEY")
AZURE_ENDPOINT = os.getenv("AZURE_OPENAI_ENDPOINT")
AZURE_DEPLOYMENT = "gpt-4o"
AZURE_API_VERSION = "2024-05-01-preview"

# Load & split documents
docs = []
for filename in os.listdir(DATA_FOLDER):
    path = os.path.join(DATA_FOLDER, filename)
    if filename.endswith(".sql") or filename.endswith(".txt"):
        loader = TextLoader(path)
        docs.extend(loader.load())
    elif filename.endswith(".pdf"):
        loader = PyMuPDFLoader(path)
        docs.extend(loader.load())

splitter = RecursiveCharacterTextSplitter(chunk_size=500, chunk_overlap=100)
split_docs = splitter.split_documents(docs)

# Embedding with Cohere
embeddings = CohereEmbeddings(
    model=EMBEDDING_MODEL,
    cohere_api_key=COHERE_API_KEY
)

# Vector store
vectorstore = FAISS.from_documents(split_docs, embeddings)
retriever = vectorstore.as_retriever(search_type="similarity", k=5)

# Azure OpenAI client
client = AzureOpenAI(
    api_key=AZURE_API_KEY,
    azure_endpoint=AZURE_ENDPOINT,
    api_version=AZURE_API_VERSION,
)

# Chat function with context memory (optional)
def start_chat():
    print("🤖 RAG Agent: Ask me anything about the PL/SQL scripts or data dictionary.")
    chat_history = []

    while True:
        user_input = input("\nYou: ").strip()
        if user_input.lower() in ["exit", "quit", "q"]:
            print("👋 Exiting. Goodbye!")
            break

        # Retrieve context from documents
        context_docs = retriever.invoke(user_input)
        context_text = "\n\n".join(doc.page_content for doc in context_docs)

        # Prepare messages
        messages = [{"role": "system", "content": f"You are a PL/SQL analyst. Use the following context to answer:\n\n{context_text}"}]
        messages += chat_history
        messages.append({"role": "user", "content": user_input})

        # Call Azure OpenAI
        response = client.chat.completions.create(
            model=AZURE_DEPLOYMENT,
            messages=messages,
            temperature=0,
            max_tokens=2048
        )

        reply = response.choices[0].message.content
        print(f"\n🤖 Agent: {reply}")

        # Update chat history
        chat_history.append({"role": "user", "content": user_input})
        chat_history.append({"role": "assistant", "content": reply})

        # Example questions
        # You: What does the mapping script do for discharge_status?
        # You: Are there null checks for payer_id?
        # You: What datatype mismatches are present?
        # Which column mappings are missing?
        # Does the script handle nulls for required fields?
        # Are any hardcoded values used?
        # Which source layouts map to the standard format version 3.2?


if __name__ == "__main__":
    start_chat()
