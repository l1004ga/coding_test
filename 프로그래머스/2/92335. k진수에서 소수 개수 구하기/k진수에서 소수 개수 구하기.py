import re

def make_k(n, k):
    k_num = ""
    while n >= k:
        (n, d) = divmod(n, k)
        k_num += str(d)
    k_num += str(n)
    return k_num[::-1]

def check_conditons(k_num, k):
    pattern = re.compile('[1-9]*')
    result = pattern.findall(k_num)
    return list(map(int, filter(None, result)))

def make_ten_and_check_prime(conditions, k):
    count = 0
    for c in conditions:
        prime = True
        if c == 1:
            continue
        for d in range(2, int(c**(0.5)) + 1):
            if c % d == 0:
                prime = False
        if prime:
            count += 1
    return count

def solution(n, k):
    k_num = make_k(n,k) # k진수로 만들어줌
    # outcomes = make_product(k_num) # k진수의 1~3개 스트링 경우의 수 만들어줌(중복제거)
    conditions = check_conditons(k_num, k) # 조건에 맞는 수만 뽑아줌
    result = make_ten_and_check_prime(conditions, k) # 10진수로 변환 및 소수 판별
    return result #조건에 해당하는 소수의 총 개수 리턴