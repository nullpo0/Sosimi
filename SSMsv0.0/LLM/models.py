import openai
import os
import time


# api키를 발급받고 환경변수에 저장
openai.api_key = os.getenv('OPENAI_KEY')

client = openai.OpenAI(api_key=os.getenv('OPENAI_KEY'))

def dataModel(prompt):
    file_list = client.files.list()
    for delFile in file_list.data:
        client.files.delete(delFile.id)

    file = client.files.create(
        file=open("assets/ppt/ppt.pptx", "rb"),
        purpose="assistants",
    )

    assistant = client.beta.assistants.retrieve('asst_97lna3gtqFVz2KsAYSO2U0s7')

    thread = client.beta.threads.create()

    message = client.beta.threads.messages.create(
        thread_id=thread.id,
        role="user",
        content=prompt,
        attachments=[
            {
                "file_id": file.id,
                "tools": [
                    {
                        "type": "file_search"
                    }
                ]
            }
        ]
    )

    run = client.beta.threads.runs.create(
        thread_id=thread.id,
        assistant_id=assistant.id,
        instructions="반말을 쓰고 상큼하고 자신있는 말투를 써.",
    )

    while True:
        if run.status == "completed":
            break
        run = client.beta.threads.runs.retrieve(thread_id=thread.id, run_id=run.id)
        # print(run)
        time.sleep(0.5)

    messages = client.beta.threads.messages.list(thread_id=thread.id)

    file_path = "fuct/assistant.txt"

    with open(file_path, "w") as f:
        f.write(f"{thread.id}\n")
        f.write(f"{run.id}\n")

    print(messages.data[0].content[0].text.value)
def scriptModel(prompt):
    file_path = "fuct/assistant.txt"

    with open(file_path, "r") as f:
        thread_id = f.readline().rstrip()
        run_id = f.readline().rstrip()

    assistant = client.beta.assistants.retrieve('asst_97lna3gtqFVz2KsAYSO2U0s7')

    message = client.beta.threads.messages.create(
        thread_id=thread_id,
        role="user",
        content=prompt,
    )

    run = client.beta.threads.runs.create(
        thread_id=thread_id,
        assistant_id=assistant.id,
        instructions="반말을 쓰고 상큼하고 자신있는 말투를 써.",
    )

    while True:
        if run.status == "completed":
            break
        run = client.beta.threads.runs.retrieve(thread_id=thread_id, run_id=run.id)
        # print(run)
        time.sleep(0.5)

    messages = client.beta.threads.messages.list(thread_id=thread_id)
    print(messages.data[0].content[0].text.value)

    return messages.data[0].content[0].text.value
