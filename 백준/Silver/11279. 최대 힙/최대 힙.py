import heapq
import sys

lines = []
for line in sys.stdin:
    lines.append(line)
lines.reverse()

max_heap = []
input_count = int(lines.pop())

for _ in range(input_count):
    i = int(lines.pop())
    if i == 0:
        if len(max_heap) == 0:
            print(0)
        else:
            print(-heapq.heappop(max_heap))
    else:
        heapq.heappush(max_heap, -i)