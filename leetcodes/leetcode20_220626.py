def isValid(s: str) -> bool:
    stack = []
    table = { 
        ')' : '(',
        '}' : '{',
        ']' : '['
    }
    
    for char in s:
        if char not in table: #key 기준 값이 있는지 확인
            stack.append(char)
        elif not stack or table[char] != stack.pop():
            return False
    # 맘에 안들어 이거 다음에 다시 풀어
        



s = "()[]{}"
isValid(s)
# s = "(]"
# isValid(s)
# s = "()"
# isValid(s)
