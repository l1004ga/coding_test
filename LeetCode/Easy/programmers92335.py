import string
import math
 
def is_prime(n):
    if n <= 1:
        return False
    for i in range(2, int(math.sqrt(n)) + 1):
        if n % i == 0:
            return False
    return True

tmp = string.digits+string.ascii_lowercase
def convert(num, base) :
    q, r = divmod(num, base)
    if q == 0 :
        return tmp[r] 
    else :
        return convert(q, base) + tmp[r]


def solution(n, k):
    return len(list(filter(is_prime, map(int, filter(lambda x: x != '', convert(n, k).split('0'))))))

print(solution(437674, 3))
print(solution(110011, 10))