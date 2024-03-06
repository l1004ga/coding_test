import heapq
import copy
from collections import deque


def solution(priorities, location):
    _deque = deque(enumerate(priorities))
    # print(list(_deque))
    count = 0
    while _deque:
        (index, value) = _deque.popleft()
        if value < max(_deque, key=lambda x: x[1])[1]:
            _deque.append((index, value))
            continue

        # 실행됨
        # print(f"실행({count}): ({index}, {value})")
        count += 1
        if index == location:
            return count
    return -1

def solution2(priorities, location):
    h = []
    result = []
    for (index, p1) in enumerate(priorities):
        heapq.heappush(h, -p1)
        priorities[index] = (p1, index)

    while h:
        max = heapq.heappop(h)

        temp = []
        for p2 in priorities:
            if p2[0] != -max:
                priorities = list(reversed(priorities))
                temp.append(priorities.pop())
                priorities = list(reversed(priorities))
            else:
                priorities = list(reversed(priorities))
                result.append(priorities.pop()[1])
                priorities = list(reversed(priorities))
                break

        priorities.extend(temp)
    
    return result.index(location)


print(solution([2, 1, 3, 2], 2)) 
print(solution([1, 1, 9, 1, 1, 1], 0))


'''
1. 실행 대기 큐(Queue)에서 대기중인 프로세스 하나를 꺼냅니다.
2. 큐에 대기중인 프로세스 중 우선순위가 더 높은 프로세스가 있다면 방금 꺼낸 프로세스를 다시 큐에 넣습니다.
3. 만약 그런 프로세스가 없다면 방금 꺼낸 프로세스를 실행합니다.
  3.1 한 번 실행한 프로세스는 다시 큐에 넣지 않고 그대로 종료됩니다.
'''
