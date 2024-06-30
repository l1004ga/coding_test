from collections import defaultdict, deque

num_computer = int(input())
connected_computer = int(input())

connect_dict = defaultdict(list)
for _ in range(connected_computer):
    key, value = list(map(int, input().split()))
    connect_dict[key].append(value)
    connect_dict[value].append(key)

visited = set()
will_visit = deque()
will_visit.append(1)
while will_visit:
    now_node = will_visit.popleft()
    visited.add(now_node)

    for node in connect_dict[now_node]:
        if node not in visited:
            will_visit.append(node)

print(len(visited) - 1)