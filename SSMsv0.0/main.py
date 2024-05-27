from pydantic import BaseModel
from LLM import models
from fuct import choice
from gemini import model
from fastapi.middleware.cors import CORSMiddleware
from fastapi import FastAPI


# 서버 구동 : 터미널창에서 uvicorn main:app --reload 입력



# 백엔드 서버 : fastApi 활용하여 구축
app = FastAPI()

# 외부 접속 허용
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# 키워드 생성 모델
class Keyword(BaseModel):
    k1: str
    k2: str
    k3: str
    k4: str
    k5: str
    k6: str
    k7: str

# GET
@app.get("/")
async def home():
    return "기프랩 소심이"


# POST
@app.post("/{category}")
async def postAndResponse(category, kw: Keyword):
    response = models.requestAPI(choice.choice(category, kw.k1, kw.k2, kw.k3, kw.k4, kw.k5, kw.k6, kw.k7))
    print(response)
    return response
