from pprint import pprint
from copy import *
from collections import deque

M, N, K = map(int, input().split())
matrix = [[0 for n in range(N)] for n in range(M)]
for k in range(K):
    y1, x1, y2, x2 = map(int, input().split())

    for x in range(x1, x2):
        for y in range(y1, y2):
            matrix[x][y] = 1

rx = [-1, 1, 0, 0]
ry = [0, 0, -1, 1]

def queue_bfs(x, y):
    visited = deque()
    visited.append((x,y))
    matrix[x][y] = 1
    count = 1
    while visited:
        nx, ny = visited.popleft()

        for index in range(4):
            mx = nx + rx[index]
            my = ny + ry[index]
            if 0 <= mx < M and 0 <= my < N and matrix[mx][my] == 0:
                matrix[mx][my] = 1
                count += 1
                visited.append((mx, my))
    return count

result = []
for x in range(M):
    for y in range(N):
        if matrix[x][y] == 0:
            result.append(queue_bfs(x,y))


result = sorted(result)
print(len(result))
for r in result:
    print(r, end= " ")