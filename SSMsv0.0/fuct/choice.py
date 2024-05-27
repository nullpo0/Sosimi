from category import mail


# 어떤 상황을 선택할 지에 관한 함수
def choice(category,k1,k2,k3,k4,k5,k6,k7):
    if category == "mail":
        return mail.prompt(k1,k2,k3,k4,k5,k6,k7)