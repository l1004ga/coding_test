from itertools import *


# def product_dictinary(my_dictinary):
    
#     for i in 
#     return dict(zip(my_dictinary, i) for i in product(*my_dictinary.values()))

def solution(users, emoticons):
    
    discount = []
    
    for (index, emoticon) in enumerate(emoticons):
        new_list = []
        new_list.append((10, round(emoticon * 0.9)))
        new_list.append((20, round(emoticon * 0.8)))
        new_list.append((30, round(emoticon * 0.7)))
        new_list.append((40, round(emoticon * 0.6)))
        discount.append(new_list)
        
    result_combinations = list(product(*discount))
    final_subscribe = 0
    final_income = 0
    
    for combination in result_combinations:
        subscribe = 0
        income = 0
        for user in users:
            limit_discount = user[0]
            limit_price = user[1]
            buy_price = 0
            for c in combination:
                # 이모티콘 할인율이 유저의 니즈보다 크면, 유저가 구매함
                if c[0] >= limit_discount:
                    buy_price += c[1]
            # 유저의 리밋 구매금액보다 이모티콘 구매 비용이 더 크면 구독으로 변경
            if buy_price >= limit_price:
                subscribe += 1
            else: # 아니면 구매에 비용을 지불함
                income += buy_price
        
        if subscribe > final_subscribe:
            final_subscribe = subscribe
            final_income = income
        elif subscribe == final_subscribe:
            if income >= final_income:
                final_income = income
        
    return [final_subscribe, final_income]