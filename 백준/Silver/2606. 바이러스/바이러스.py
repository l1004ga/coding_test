from collections import defaultdict, deque

num_computer = int(input())
connected_computer = int(input())

connect_dict = defaultdict(dict)
for _ in range(connected_computer):
    key, value = list(map(int, input().split()))
    connect_dict[key][value] = True
    connect_dict[value][key] = True

visited = set()
will_visit = deque()
will_visit.append(1)
while will_visit:
    now_node = will_visit.popleft()
    visited.add(now_node)

    for key in connect_dict[now_node].keys():
        if key not in visited:
            will_visit.append(key)

print(len(visited) - 1)