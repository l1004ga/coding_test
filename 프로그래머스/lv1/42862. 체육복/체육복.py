from collections import defaultdict


def solution(n, lost, reserve):
    # 체육복을 잃어버리거나 여분을 챙기지 않으면 전부 1개를 가지고 있음
    cloth_list = [1 for i in range(n)]
    lost_list = [0 for i in range(n)]
    
    count = 0
    
    # 체육복 2개 가진 친구들
    for r in reserve:
        cloth_list[r-1] += 1
    
    # 체육복 없는 친구들
    for l in lost:
        cloth_list[l-1] -= 1
        
    # 확인해야하는 친구들
    
    check = list(set(lost) - set(reserve))
    # print(check)

    # print(cloth_list)
    
    for l in sorted(check):
        # 왼쪽친구가 2개 가지고 있으면
        if l == 1:
            if cloth_list[l] == 2:
                cloth_list[l-1] += 1
                cloth_list[l] -= 1
        elif 1 < l < n:
            if cloth_list[l-2] == 2:
                cloth_list[l-2] -= 1
                cloth_list[l-1] += 1
            elif cloth_list[l] == 2:
                cloth_list[l-1] += 1
                cloth_list[l] -= 1
        else:
            if cloth_list[l-2] == 2:
                cloth_list[l-2] -= 1
                cloth_list[l-1] += 1

    for c in cloth_list:
        if c >= 1:
            count += 1
    # print(count)
    return count