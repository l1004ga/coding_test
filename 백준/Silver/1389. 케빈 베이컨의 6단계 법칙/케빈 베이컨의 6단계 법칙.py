from collections import defaultdict, deque
import sys


# N, M = int(sys.stdin.readline().split())
# relation = defaultdict(list)
# for m in range(M):
#     a, b = int(sys.stdin.readline().split())
#     relation[a].append(b)
#     relation[b].append(a)

N, M = map(int, input().split())
relation = defaultdict(list)
for m in range(M):
    a, b = map(int, input().split())
    relation[a].append(b)
    relation[b].append(a)

# 테스트코드
# N, M = 5, 5
# relation = defaultdict(list)
# for m in [[1,4],[1,3],[4,5],[4,3],[3,2]]:
#     a, b = m[0], m[1]
#     relation[a].append(b)
#     relation[b].append(a)

min_kb = 5001

kb_score = {}

min_value = 5001
for start_vertex in range(N):
    new_relation = relation
    score = {}
    visited = []
    will_visited = deque()
    will_visited.append((start_vertex + 1,0))
    while len(visited) != N:
        num, count =  will_visited.popleft()
        if num in visited:
            continue

        visited.append(num)
        score[num] = count
        for next in new_relation[num]:
            will_visited.append((next,count+1))

    person_score = sum(score.values())
    kb_score[start_vertex + 1] = person_score
    min_value = min(min_value, person_score)

result = []
for key, value in kb_score.items():
    if value == min_value:
        result.append(key)


print(sorted(result)[0])
