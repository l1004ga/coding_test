'''
// 어떤 방법으로도 두개의 큐가 같게 될 수 없는 경우 -1을 리턴
1. queue1 +queue2 = 홀수면 -1 리턴
2. queue1 +queue2 = 짝수면 원소 합 같게 만들 수 있는지 확인필요
'''
'''
def 


def solution(queue1, queue2):
    answer = -2
    sum_queue1 = sum(queue1)
    sum_queue2 = sum(queue2)
    all_sum = sum_queue1 + sum_queue2
    if all_sum % 2 != 0:
        answer = -1
        print(answer)
        return answer
    else:
        if sum_queue1 < sum_queue2:
            diff = sum_queue2 - sum_queue1
        elif sum_queue1 == sum_queue2:
            answer = 0
            return answer
        else:
            diff = sum_queue1 - sum_queue2
            print(diff)


    return answer
'''
from collections import deque
class queue_with_suming:
    def __init__(self, queue):
        self.queue = deque(queue)
        self.sum = sum(queue)

    def popleft(self):
        v = self.queue.popleft()
        self.sum -= v
        return v

    def append(self, v):
        self.queue.append(v)
        self.sum += v

def pop_and_append(from_, to_):
    v = from_.popleft()
    to_.append(v)
    return v

def solution(queue1, queue2):
    queue1 = queue_with_suming(queue1)
    queue2 = queue_with_suming(queue2)
    work_count = 0

    while work_count <= 300000:
        if queue1.sum - queue2.sum == 0:
            return work_count
        if len(queue1.queue) == 0:
            pop_and_append(queue2, queue1)
            work_count += 1
        if len(queue2.queue) == 0:
            pop_and_append(queue1, queue2)
            work_count += 1
        if queue1.sum > queue2.sum:
            pop_and_append(queue1, queue2)
            work_count += 1
        if queue2.sum > queue1.sum:
            pop_and_append(queue2, queue1)
            work_count += 1
    if work_count > 300000:
        return -1

    return work_count

queue1 = [3, 2, 7, 2]	
queue2 = [4, 6, 5, 1]
solution(queue1, queue2)