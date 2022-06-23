# 리스트 문제

# 3번째 풀이
import re

def isPalindrome(self, s: str) -> bool:
    s = s.lower()
    s = re.sub('[^a-z0-9]', '', s)

    return s == s[::-1]

tc1 = "A man, a plan, a canal: Panama"
isPalindrome(tc1)
tc2 = "race a car"
isPalindrome(tc2)

# 1번째 풀이
def solution(tc):
    a = [] #대소문자 통일 값을 담을 리스트
    for i in tc:
        if i.isalnum():
            a.append(i.lower())

    '''펠린드롬 여부 확인'''
    while len(a) > 1:
        if a.pop(0) != a.pop():
            return False
    return True

# 2번째 풀이
from collections import deque

def isPalindrome(self, s: str) -> bool:

    a : deque = collections.deque()

    for i in s:
        if i.isalnum():
            a.append(i.lower())
    
    while len(a) > 1:
        if a.popleft() != a.pop():
            return False
        return True
'''            
