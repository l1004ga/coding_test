import heapq

def solution(priorities, location):

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
    
    return result.index(location) + 1