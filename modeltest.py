import os
import openai

from dotenv import load_dotenv

load_dotenv()

openai.api_key = os.getenv("OPENAI_API_KEY")
openai.api_base = os.getenv("OPENAI_API_BASE")
openai.api_version = "2024-05-01-preview"
openai.api_type = "azure"
engine = "gpt-4o"

client = openai.AzureOpenAI(
    api_key=os.getenv("OPENAI_API_KEY"),
    azure_endpoint=os.getenv("AZURE_OPENAI_ENDPOINT"),
    api_version="2024-05-01-preview"
)

query = "How to load images from the DIR1 directory, resize them to 640*640 and save them to the DIR2 directory?"

messages = [
    {
        "role": "assistant",
        "content": "You are a python expert. You will analyse the prompt and generate the python code.",
    },
    {"role": "user", "content": query},
]

response = client.chat.completions.create(
    model="gpt-4o",
    messages=messages,
    temperature=0,
    max_tokens=2048
)

print(response.choices[0].message.content)