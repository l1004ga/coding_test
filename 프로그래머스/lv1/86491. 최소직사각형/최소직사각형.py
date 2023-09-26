def solution(sizes):
    
    max_number = 0
    max_group = []
    
    for s in sizes:
        if max_number < max(s[0], s[1]):
            max_number = max(s[0], s[1])
            max_group = s
    
    if max_group[0] >= max_group[1]:
        for s in sizes:
            if s[1] > max_group[1] and s[0] > max_group[1]:
                max_group[1] = min(s[0], s[1])
    else:
       for s in sizes:
            if s[0] > max_group[0] and s[1] > max_group[0]:
                max_group[0] = min(s[0], s[1]) 
    
    # print(max_group)
    
    return max_group[0] * max_group[1]