import heapq
from heapq import heappop
from heapq import heappush

def solution(scoville, K):
    count = 0
    
    my_heapq = []
    
    for scv in scoville:
        heapq.heappush(my_heapq, scv)
    
    while my_heapq[0] < K:
        
        if len(my_heapq) <= 1:
            return -1
        
        first = heappop(my_heapq)
        second = heappop(my_heapq)
        new_scv = first + (second * 2)
        heappush(my_heapq, new_scv)
        count += 1
    
    return count