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
    # apeach = [(2, 3), (1, 4), (0, 3)]

    lion_score = sum(map(lambda x: x[0], guess))
    for g in guess:
        apeach = list(filter(lambda x: x[0] != g[0], apeach))
    apeach_score = sum(map(lambda x: x[0], apeach))
    # print("")
    return lion_score - apeach_score

def get_score_of_combination2(guess: List[Tuple[int, int]], apeach: List[Tuple[int, int]]) -> int:
    # apeach = [(2, 3), (1, 4), (0, 3)]

    lion_score = sum(map(lambda x: x[0], guess))
    for g in guess:
        apeach = list(filter(lambda x: x[0] != g[0], apeach))
    apeach_score = sum(map(lambda x: x[0], apeach))
    # print(f'라이언 : {guess}, 어피치 : {apeach}')
    # print(f'라이언 스코어 : {lion_score}, 어피치 스코어 : {apeach_score}')
    return lion_score - apeach_score

def make_combination(n,lions):
    new = []
    for i in range(1, n+1):
        new.append(list(combinations(lions, i)))
    
    # print("new")
    return new

# [(10, 1), (9, 1), (8, 2), (7, 3), (5, 2), (0, 0)] -> [1,1,2,3,0,2,0,0,0,0,0]
def convert_answer_format(board : List[Tuple[int,int]]) -> List[int]:
    new = [0] * 11
    for (score, count) in board:
        new[10 - score] = count
    return new


def solution(n, info):
    lions = list(map(lambda x:x + 1, info))
    lions = [(abs(index - 10), lion) for (index, lion) in enumerate(lions)]
    apeaches  = [(abs(index - 10), apeach) for (index, apeach) in enumerate(info) if apeach > 0] # 어피치 점수 중 0이 아닌 것들은 제외함

    comb = make_all_combinations(lions[:-1]) # 라이언이 이길 수 있는 모든 과녁판의 모든 조합의 경우의 수
    comb_extended = []
    for item in comb:
        comb_extended.append(item + [(0, 0)])
        comb_extended.append(item + [(0, 1)])
        comb_extended.append(item + [(0, 2)])
        comb_extended.append(item + [(0, 3)])
        comb_extended.append(item + [(0, 4)])
        comb_extended.append(item + [(0, 5)])
        comb_extended.append(item + [(0, 6)])
        comb_extended.append(item + [(0, 7)])
        comb_extended.append(item + [(0, 8)])
        comb_extended.append(item + [(0, 9)])
        comb_extended.append(item + [(0, 10)])

    for item in comb_extended:
        _list = [0] * 11
        for (index, value) in item:
            _list[abs(index - 10)] = value
        # print(_list)
    # print(lions)
    
    comb2 = list(filter(lambda x: return_true_if_sum_of_tuple1_is_n(x, n), comb_extended)) # comb에서 나올 경우의 수 중 화살 수의 합이 n인 경우만 픽
    comb3 = sorted(comb2, key=lambda x: get_score_of_combinations(x, apeaches), reverse=True) #라이언이 큰 점수차로 이긴 내림차순대로 정렬
    max_score = get_score_of_combinations(comb3[0], apeaches)

    if max_score <= 0: # 어피치를 이길 수 없을 때
        # print("가능성이 0개인 것")
        return [-1]

    same_score = [] # 같은 점수차의 라이언 점수판 넣을 배열 선언
    for one_of_c in comb3:
        one_of_score = get_score_of_combinations(one_of_c, apeaches)
        if max_score == one_of_score:
            same_score.append(one_of_c)
        else:
            break

    return list(reversed(sorted(list(map(lambda x: list(reversed(x)), map(convert_answer_format, same_score))))[-1]))


print(solution(5,	[2,1,1,1,0,0,0,0,0,0,0])) #[0,2,2,0,1,0,0,0,0,0,0] 1개
print(solution(1,	[1,0,0,0,0,0,0,0,0,0,0])) # [-1] 0개
print(solution(9,	[0,0,1,2,0,1,1,1,1,1,1])) # [1,1,2,0,1,2,2,0,0,0,0] 2개
print(solution(10,	[0,0,0,0,0,0,0,0,3,4,3])) #[1,1,1,1,1,1,1,1,0,0,2] [(10, 1)(9, 1),(8, 1),1,1,1,1,0,0,4,0,0] 