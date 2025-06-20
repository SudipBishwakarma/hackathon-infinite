from datetime import datetime, timezone
from typing import List, AsyncGenerator

from fastapi import Depends, FastAPI, HTTPException, Path, WebSocket, WebSocketDisconnect
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import StreamingResponse, HTMLResponse

from sqlalchemy import func, and_
from sqlalchemy.orm import Session

from utils.config import Config
from utils.logger import Logger
from utils.db_utils import RoleEnum, ChatOut, Chat, ChatRequest, get_db
from chatbot import start_chat, start_chat_stream


config = Config()
logger = Logger.get_logger(name=config.app_name, level=config.log_level)
app = FastAPI()


app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # Replace with frontend URL in production
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get("/")
def home():
    return HTMLResponse("<center><h1>API service is running...</h1></center>")

@app.post("/chat")
async def chat_stream(request: ChatRequest, db: Session = Depends(get_db)):
    message = Chat(
        thread_id=request.thread_id,message=request.question,
        role=RoleEnum.user, createdDt=datetime.now(timezone.utc)
    )
    db.add(message)
    db.commit()
    logger.info(f"API called: {request.question} | Thread ID: {request.thread_id}")
    chat_history = (
        db.query(Chat)
        .filter(Chat.thread_id == request.thread_id)
        .order_by(Chat.createdDt.asc())
        .all()
    )
    chat_history_list = [
        {
            "role": chat.role,
            "message": chat.message,
        }
        for chat in chat_history
    ]
    def stream_response() -> AsyncGenerator[str, None]:
        response, ai_message = start_chat(request.question, chat_history_list)
        if ai_message:
            ai_message = Chat(
                thread_id=request.thread_id, message=ai_message,
                role=RoleEnum.assistant, createdDt=datetime.now(timezone.utc)
            )
            db.add(ai_message)
            db.commit()
        yield response

    return StreamingResponse(stream_response(), media_type="text/plain")


@app.get("/chats", response_model=List[ChatOut])
async def get_chat(db: Session = Depends(get_db)):
    subquery = (
        db.query(
            Chat.thread_id,
            func.min(Chat.createdDt).label("first_created")
        )
        .group_by(Chat.thread_id)
        .subquery()
    )

    chats = (
        db.query(Chat)
        .join(
            subquery,
            and_(
                Chat.thread_id == subquery.c.thread_id,
                Chat.createdDt == subquery.c.first_created
            )
        )
        .order_by(Chat.createdDt.asc())
        .all()
    )

    return chats


@app.get("/chats/{thread_id}", response_model=List[ChatOut])
async def get_chats_by_uuid(
    thread_id: str = Path(..., description="The thread ID to filter chats by"),
    db: Session = Depends(get_db)
):
    chats = (
        db.query(Chat)
        .filter(Chat.thread_id == thread_id)
        .order_by(Chat.createdDt.asc())
        .all()
    )
    return chats


@app.delete("/chat/{thread_id}")
async def delete_chat(
    thread_id: str = Path(..., description="The thread ID to delete"),
    db: Session = Depends(get_db)
):
    deleted_count = db.query(Chat).filter(Chat.thread_id == thread_id).delete(synchronize_session=False)

    if deleted_count == 0:
        raise HTTPException(status_code=404, detail="No chats found with this thread_id")

    db.commit()
    return {"message": "Chat deleted successfully"}


@app.post("/test")
async def stream(request: ChatRequest, db: Session = Depends(get_db)):
    logger.info(f"API called: {request.question} | Thread ID: {request.thread_id}")
    chat_history = (
        db.query(Chat)
        .filter(Chat.thread_id == request.thread_id)
        .order_by(Chat.createdDt.asc())
        .all()
    )
    chat_history_list = [
        {
            "role": chat.role,
            "message": chat.message,
        }
        for chat in chat_history
    ]
    def stream_response() -> AsyncGenerator[str, None]:
        logger.info(f"API called: {request.question} | Thread ID: {request.thread_id}")
        response, ai_message = start_chat(request.question, chat_history_list)
        yield response

    return StreamingResponse(stream_response(), media_type="text/plain")


@app.websocket("/ws/chat/{thread_id}")
async def websocket_chat(
    websocket: WebSocket, 
    thread_id: str = Path(...), 
    db: Session = Depends(get_db)
):
    await websocket.accept()
    try:
        while True:
            data = await websocket.receive_json()
            question = data.get("question")
            thread_id = data.get("thread_id")

            if not question or not thread_id:
                await websocket.send_text("Invalid request.")
                continue

            # Fetch history
            chat_history = (
                db.query(Chat)
                .filter(Chat.thread_id == thread_id)
                .order_by(Chat.createdDt.asc())
                .all()
            )
            chat_history_list = [{"role": chat.role, "message": chat.message} for chat in chat_history]

            # Save user message
            user_msg = Chat(
                thread_id=thread_id,
                message=question,
                role=RoleEnum.user,
                createdDt=datetime.now(timezone.utc),
            )
            db.add(user_msg)
            db.commit()

            # Stream assistant response
            full_response = ""
            async for chunk in start_chat_stream(question, chat_history_list):
                full_response += chunk
                await websocket.send_text(chunk)

            # Save assistant message
            if full_response.strip():
                db.add(Chat(
                    thread_id=thread_id,
                    message=full_response,
                    role=RoleEnum.assistant,
                    createdDt=datetime.now(timezone.utc),
                ))
                db.commit()
            await websocket.send_text("[END]")

    except WebSocketDisconnect:
        logger.info("WebSocket disconnected.")
