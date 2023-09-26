from itertools import permutations
import math

def is_prime(x):
    
    if x == 0 or x == 1:
        return False
        
    if x == 2:
        return True
    
    for i in range(2, int(math.sqrt(x)) + 1):
        if x % i == 0:
            return False
    return True

def solution(numbers):
    number_list = set()
    result = 0
    for i in range(len(numbers)):
        for x in permutations(numbers, i+1):
            number_list.add(int(''.join(x)))
    
    for n in number_list:
        
        if is_prime(n) == True:
            result += 1
    
    return result