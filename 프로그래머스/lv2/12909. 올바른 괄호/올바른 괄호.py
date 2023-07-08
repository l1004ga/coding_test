def solution(s):
    
    left = []
    
    for b in s:
        if b == "(":
            left.append(b)
        else:
            if left:
                left.pop()
            else:
                return False
            
    if not left:
        return True
    else:
        return False