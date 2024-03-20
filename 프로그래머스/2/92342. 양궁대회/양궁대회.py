from itertools import combinations
from typing import *

def make_all_combinations(lions: List[Tuple[int, int]]) -> List[List[Tuple[int, int]]]:

    if len(lions) == 0:
        return []
    return [lions[:1]] + [lions[:1] + item for item in make_all_combinations(lions[1:])] + [item for item in make_all_combinations(lions[1:])]

def return_true_if_sum_of_tuple1_is_n(guess: List[Tuple[int, int]], n: int) -> bool:
    # guess: [(10,2), (9, 3), (7,2)]
    return sum(map(lambda x: x[1], guess)) == n

def get_score_of_combinations(guess: List[Tuple[int, int]], apeach: List[Tuple[int, int]]) -> int:

    lion_score = sum(map(lambda x: x[0], guess))
    for g in guess:
        apeach = list(filter(lambda x: x[0] != g[0], apeach))
    apeach_score = sum(map(lambda x: x[0], apeach))

    return lion_score - apeach_score

def solution(n, info):
    lions = list(map(lambda x:x + 1, info))
    lions = [(abs(index - 10), lion) for (index, lion) in enumerate(lions)]
    apeaches  = [(abs(index - 10), apeach) for (index, apeach) in enumerate(info) if apeach > 0] # 어피치 점수 중 0이 아닌 것들은 제외함

    comb = make_all_combinations(lions) # 라이언이 이길 수 있는 모든 과녁판의 모든 조합의 경우의 수
    comb2 = list(filter(lambda x: return_true_if_sum_of_tuple1_is_n(x, n), comb)) # comb에서 나올 경우의 수 중 화살 수의 합이 n인 경우만 픽
    comb3 = sorted(comb2, key=lambda x: get_score_of_combinations(x, apeaches), reverse=True) #라이언이 큰 점수차로 이긴 내림차순대로 정렬
    max_score = get_score_of_combinations(comb3[0], apeaches)

    if max_score <= 0: # 어피치를 이길 수 없을 때
        return [-1]

    same_score = [] # 같은 점수차의 라이언 점수판 넣을 배열 선언
    for one_of_c in comb3:
        one_of_score = get_score_of_combinations(one_of_c, apeaches)
        if max_score == one_of_score:
            same_score.append(one_of_c)
        else:
            break

    default = [0 for i in range(11)]
    if len(same_score) == 1: # 어피치를 이길 수 있는 점수차가 가장 큰 것이 1개만 있을 경우
        for s in same_score[0]:
            default[s[0]] = s[1]
        return list(reversed(default))
    
    min_num_of_each_score = []
    for (index, s) in enumerate(same_score):
        min_num_of_each_score.append((min(map(lambda x:x[0], s)), index)) #가장 작은 점수판 있는 라이언 기록지 고르기
    
    result = same_score[min(min_num_of_each_score)[1]]

    for r in result:
        default[r[0]] = r[1]
    else:
        return list(reversed(default))

    # return list(reversed(default))