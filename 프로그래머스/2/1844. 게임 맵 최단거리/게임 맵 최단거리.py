from copy import *
from collections import deque
from pprint import pprint

def bfs(maps, row, col, n_row, n_col, visited, scores):
    if (n_row, n_col) in visited:
        return
    if n_row < 0 or n_row == len(maps) or n_col < 0 or n_col == len(maps[0]) or maps[n_row][n_col] == 0 or maps[n_row][n_col] == 2:
        return

    visited.append((n_row, n_col))
    scores[n_row][n_col] = scores[row][col] + 1

def solution(maps):
    visited = deque()
    visited.append((0,0))
    scores = [[0 * c for c in range(len(maps[0]))]for r in range(len(maps))]

    while visited:
        row,col = visited.popleft()
        maps[row][col] = 2
        if row == len(maps) - 1 and col == len(maps[0]) - 1:
            break

        bfs(maps, row, col, row - 1, col, visited, scores)
        bfs(maps, row, col, row, col + 1, visited, scores)
        bfs(maps, row, col, row + 1, col, visited, scores)
        bfs(maps, row, col, row, col - 1, visited, scores)

    if scores[len(maps) - 1][len(maps[0]) - 1] == 0:
        return -1
    else:
        return scores[len(maps) - 1][len(maps[0]) - 1] + 1
