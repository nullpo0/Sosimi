from category import delivery

# 어떤 상황을 선택할 지에 관한 함수
def choice(category,k1,k2,k3,k4):
    if category == "delivery":
        return delivery.Delivery(k1,k2,k3,k4).prompt()