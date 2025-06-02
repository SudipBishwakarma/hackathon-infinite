from typing import List, AsyncGenerator
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import StreamingResponse, HTMLResponse
from pydantic import BaseModel
from dotenv import load_dotenv

from ragService import start_chat

load_dotenv()

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # Replace with frontend URL in production
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

class ChatRequest(BaseModel):
    question: str
    history: List[dict]

@app.get("/")
def home():
    return HTMLResponse("<center><h1>API service is running...</h1></center>")

@app.post("/chat")
async def chat_stream(request: ChatRequest):
    def stream_response() -> AsyncGenerator[str, None]:
        chat_history = request.history
        user_input = request.question
        response = start_chat(user_input, chat_history)
        reply = response.choices[0].message.content
        # Update chat history
        chat_history.append({"role": "user", "content": user_input})
        chat_history.append({"role": "assistant", "content": reply})
        for chunk in response:
            if chunk.choices[0].delta.content:
                yield chunk.choices[0].delta.content

    return StreamingResponse(stream_response(), media_type="text/plain")
