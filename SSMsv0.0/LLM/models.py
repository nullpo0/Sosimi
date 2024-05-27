import openai
import os


def requestAPI(prompt):
    # api키를 발급받고 환경변수에 저장
    openai.api_key = os.getenv('OPENAI_KEY')

    stream = openai.chat.completions.create(
        model='gpt-3.5-turbo-0125',

        messages=[
            {
                "role": "system",
                "content": "반말을 쓰고 상큼하고 자신있는 말투를 써."
            },
            {
                "role": "user",
                "content": prompt
            }
        ]
    )
    return stream.choices[0].message.content