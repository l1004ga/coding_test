import heapq
from heapq import heappop, heappush, heappushpop, heapify

def solution(operations):
    answer = []
    my_heap = []
    
    for op in operations:
        new_op = op.split(' ')
        if new_op[0] == 'I':
            heapq.heappush(my_heap, int(new_op[1]))
        elif new_op[0] == 'D':
            
            if len(my_heap) == 0:
                continue
            
            if int(new_op[1]) == -1: #최솟값
                heappop(my_heap)
            elif int(new_op[1]) == 1: #최댓값
                my_heap.pop()
    
    return [max(my_heap), min(my_heap)] if len(my_heap) != 0 else [0, 0]