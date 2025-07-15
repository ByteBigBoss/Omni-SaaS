from pydantic import BaseSettings, AnyHttpUrl
from typing import List

class Settings(BaseSettings):
    SUPABASE_URL: str
    SUPABASE_JWT_SECRET: str
    STRIPE_SECRET_KEY: str
    HUGGINGFACE_TOKEN: str
    BACKEND_CORS_ORIGINS: List[AnyHttpUrl] = ["http://localhost:3000"]

    class Config:
        env_file = ".env"

settings = Settings()
