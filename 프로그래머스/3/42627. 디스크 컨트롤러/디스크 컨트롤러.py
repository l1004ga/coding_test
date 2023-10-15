import heapq
from heapq import heappop, heappush, heapify


def solution(jobs):

    현재시간 = 0
    누적작업수행시간 = 0
    
    count = len(jobs)
    
    while jobs:
        my_heapq = []
        # now를 기점으로 이미 들어온 작업 중 수행시간이 가장 작은 작업 수행함
        for j in jobs:
            if j[0] <= 현재시간:
                heapq.heappush(my_heapq, [j[1], j])
        
        if len(my_heapq) == 0:
            현재시간 += 1
            continue
             
        # 가장 시간 작은 작업 수행 및 jobs 삭제 + 수행시간 업데이트
        job = heappop(my_heapq)[1]
        현재시간 += job[1]
        누적작업수행시간 += 현재시간 - job[0]
        jobs.remove(job)
        
    return int(누적작업수행시간 / count)