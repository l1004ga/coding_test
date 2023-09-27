def make_divisor(num):
    
    data = set()
    for n in range(1, num+1):
        if num % n == 0:
            if int(num / n) > 2 and n > 2:
                if int(num / n) >= n:
                    data.add((int(num / n), n))
                else:
                    data.add((n, (int(num / n))))
    
    return data
        


def solution(brown, yellow):
    divisor = make_divisor(brown+yellow)
    
    for d in divisor:
        border = d[0] * 2 + (d[1]-2) * 2
        
        if border == brown:
            return [d[0], d[1]]
    
    return [brown, yellow]