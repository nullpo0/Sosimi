# 카테고리의 한 가지 예시 : 배달 전화 주문
class Delivery:
    def __init__(self, store_name, munu, amount, location):
        self.store_name = store_name
        self.munu = munu
        self.amount = amount
        self.location = location

    # 프롬프트
    def prompt(self):
        return f'''배달 주문을 할 건데 다음 정보를 활용해서 어떻게 전화하면 될 지 알려줘.
        가게이름 : {self.store_name}
        메뉴이름 : {self.munu}
        수량 : {self.amount}
        집 주소 : {self.location}'''