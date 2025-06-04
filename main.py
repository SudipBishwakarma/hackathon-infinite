import os
from dotenv import load_dotenv
from openai import AzureOpenAI
from openai.types.chat import (
    ChatCompletionSystemMessageParam,
    ChatCompletionUserMessageParam,
    ChatCompletionAssistantMessageParam,
)

# Load environment variables from .env file
load_dotenv()

client = AzureOpenAI(
  azure_endpoint = os.getenv("AZURE_OPENAI_ENDPOINT"), 
  api_key=os.getenv("AZURE_OPENAI_API_KEY"),  
  api_version=os.getenv("AZURE_OPENAI_API_VERSION")
)

response = client.chat.completions.create(
    model=os.getenv("DEPLOYMENT_NAME"),
    messages=[
        ChatCompletionSystemMessageParam(role="system", content="You are a helpful assistant."),
        ChatCompletionUserMessageParam(role="user", content="Does Azure OpenAI support customer managed keys?"),
        ChatCompletionAssistantMessageParam(role="assistant", content="Yes, customer managed keys are supported by Azure OpenAI."),
        ChatCompletionUserMessageParam(role="user", content="Do other Azure services support this too?")
    ]
)

print(response.choices[0].message.content)
