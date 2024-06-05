import openai
import os


def requestAPI(prompt):
    # api키를 발급받고 환경변수에 저장
    openai.api_key = os.getenv('OPENAI_KEY')

    client = openai.OpenAI(api_key=os.getenv('OPENAI_KEY'))

    assistant = client.beta.assistants.create(
        name= "발표도우미 풋사과",
        instructions="",
        model= "gpt-3.5-turbo-0125",
        tools= [{"type": "retrieval"}]
    )

    file = client.files.create(
        file=open(
            "assets/DataAttribution.pptx",
            "rb",
        ),
        purpose="assistants",
    )

    assistant = client.beta.assistants.update(
        assistant.id,
        file_ids=[file.id],
    )


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