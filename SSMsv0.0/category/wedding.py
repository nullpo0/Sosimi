class Wedding:
    def __init__(self, who, role, imtimacy, add_info):
        self.who = who
        self.role = role
        self.imtimacy = imtimacy
        self.add_info = add_info

    def prompt(self):
        return f'''
        누구의 결혼식인가 : {self.who}
        나의 역할은 무엇인가 : {self.role}
        대상과의 친밀도는 어떤가(0 : 별로 안 친함, 100 : 매우 친함) : {self.imtimacy}
        추가 정보 : {self.add_info}
        위 정보를 활용하여 결혼식에서의 절차 안내를 아래 조건과 양식에 맞게 출력해줘.
        조건 1 : 절차 내에 대상에게 해줄 나의 멘트가 들어가야함.
        조건 2 : 절차 안내를 5가지로 나눌 것.
        조건 3 : 반드시 양식만을 출력할 것.
        ***출력양식***
        결혼식 절차 안내입니다.
          1. (첫번째 절차)
          2. (두번째 절차)
          3. (세번째 절차)
          4. (네번째 절차)
          5. (마지막 절차)
        ************
        '''