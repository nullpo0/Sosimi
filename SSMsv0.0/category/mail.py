

def prompt(gender, age, mbti, job, receiver, purpose, send):
    return f'''
    아래 정보들을 참고하여 "메일 작성"하는 과정을 step-by-step으로 작성해줘.
    
    ***사용자 정보***
    gender : {gender}
    age : {age}
    mbti : {mbti}
    job : {job}
    ***************
    
    ****상황 설명****
    수신자 : {receiver}
    메일 작성 목적 : {purpose}
    전달할 내용 : {send}
    ****************
    '''