import os
from fuct import userData
from LLM import createPrompt, models
from pydantic import BaseModel
from fastapi.middleware.cors import CORSMiddleware
from fastapi import FastAPI, File, UploadFile

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
class Data(BaseModel):
    d1: str
    d2: str
    d3: str
    d4: str
    d5: str
    d6: str
    d7: str

class Script(BaseModel):
    slide: str
    script: str


# GET
@app.get("/")
async def home():
    return "기프랩 소심이"


# POST
@app.post("/uploadppt")
async def upload_ppt(file: UploadFile):
    ppt_dir = "./assets/ppt"

    content = await file.read()
    filename = "ppt.pptx"
    with open(os.path.join(ppt_dir, filename), "wb") as fp:
        fp.write(content)

    return {"file": file.filename}

@app.post("/uploadmp4")
async def upload_mp4(file: UploadFile):
    mp4_dir = "./assets/mp4"

    content = await file.read()
    filename = "speech.mp4"
    with open(os.path.join(mp4_dir, filename), "wb") as fp:
        fp.write(content)

    return {"file": file.filename}

@app.post("/postData")
async def postData(data : Data):
    userData.writeUserData(data.d1, data.d2, data.d3, data.d4)
    models.dataModel(createPrompt.infoPrompt(data.d5, data.d6, data.d7))
    return {"state": "success"}

@app.post("/postScript")
async def postScript(script: Script):
    return models.scriptModel(createPrompt.scriptPrompt(script.slide, script.script))