import heapq
from heapq import heappop, heappush

def solution(jobs):

    runtimes = 0
    result = 0
    
    count = len(jobs)
    
    while jobs:
        my_heapq = []
        # now를 기점으로 이미 들어온 작업 중 수행시간이 가장 작은 작업 수행함
        for j in jobs:
            if j[0] <= runtimes:
                heapq.heappush(my_heapq, [j[1], j])
        
        if len(my_heapq) == 0:
            runtimes += 1
            continue
             
        # 가장 시간 작은 작업 수행 및 jobs 삭제 + 수행시간 업데이트
        job = my_heapq[0][1]
        runtimes += job[1]
        result += runtimes - job[0]
        jobs.remove(job)
        
    return int(result / count)