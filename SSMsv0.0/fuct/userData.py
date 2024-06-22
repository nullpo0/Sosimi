def writeUserData(gender, age, mbti, job):
    file_path = "fuct/userData.txt"

    with open(file_path, "w") as f:
        f.write(f"{gender}\n")
        f.write(f"{age}\n")
        f.write(f"{mbti}\n")
        f.write(f"{job}")

def dataRemove():
    file_path = "fuct/userData.txt"

    with open(file_path, "w") as f:
        f.truncate()

