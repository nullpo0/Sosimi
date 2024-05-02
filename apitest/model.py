import google.generativeai as genai

#api키 받는법 : gemini api치고 공홈가서 키 발급
google_api_key = '여기에 발급받은 키 입력'

genai.configure(api_key=google_api_key)

model = genai.GenerativeModel('gemini-pro')