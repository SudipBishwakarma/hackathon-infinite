from datetime import datetime, timezone

from sqlalchemy import create_engine, Column, Integer, String, DateTime
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker
from sqlalchemy import Enum

from pydantic import BaseModel

from .config import Config
config = Config()

engine = create_engine(config.database_url, connect_args={"check_same_thread": False})
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)
Base = declarative_base()


class RoleEnum(str, Enum):
    user = "human"
    assistant = "ai"


class ChatOut(BaseModel):
    thread_id: str
    message: str
    role: str
    createdDt: datetime

    class Config:
        orm_mode = True


class Chat(Base):
    __tablename__ = config.table_name

    id = Column(Integer, primary_key=True, index=True, autoincrement=True)
    thread_id = Column(String, index=True)
    message = Column(String)
    role = Column(String, nullable=False)
    createdDt = Column(DateTime, default=datetime.now(timezone.utc))


Base.metadata.create_all(bind=engine)


class ChatRequest(BaseModel):
    question: str
    history: list[dict]
    thread_id: str


def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()
