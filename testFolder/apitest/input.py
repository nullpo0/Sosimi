#사용자 입력
store_name = input("store_name:")
menu = input("menu:")
amount = input("amount:")
location = input("location:")
#은닉 부분
inputs = (f"배달 주문을 할건데 다음 정보를 활용해서 어떻게 전화하면 될 지 알려줘."
          f"가게이름 : {store_name}"
          f"메뉴이름 : {menu}"
          f"수량 : {amount}"
          f"집 주소 : {location}")