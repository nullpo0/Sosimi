import google.generativeai as genai
import os

# api키를 발급받고 환경변수에 저장
API_KEY = os.getenv("GEMINI_KEY")

genai.configure(api_key=API_KEY)

# 모델은 gemini-pro
model = genai.GenerativeModel('gemini-pro')
