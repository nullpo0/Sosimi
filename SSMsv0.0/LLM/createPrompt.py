def infoPrompt(audience, topic, include):
    file_path = "fuct/userData.txt"

    with open(file_path, 'r') as f:
        gender = f.readline()
        age = f.readline()
        mbti = f.readline()
        job = f.readline()

    prompt = f"""
    ***사용자 정보***
    성별 : {gender.rstrip()}
    나이 : {age.rstrip()}
    MBTI : {mbti.rstrip()}
    직업 : {job}
    ----------------
    ***발표 정보***
    청중 : {audience}
    발표 주제 : {topic}
    포함해야 할 내용 : {include}
    발표 자료 : 첨부된 ppt
    -----------------
    """

    return prompt


def scriptPrompt(slide, script):
    return f"""
    슬라이드 번호 : {int(slide)-1}
    발표 대본 : {script}    
    """