from collections import deque

def solution(maps):

    xy = [(-1,0), (1,0), (0, -1), (0,1)]
    
    def bfs(x,y):
        check_queue = deque()
        check_queue.append((x,y))
        
        while check_queue:
            x, y = check_queue.popleft()
            
            for i in range(4):
                row = x + xy[i][0]
                col = y + xy[i][1]
                
                if row < 0 or len(maps) <= row or col < 0 or len(maps[0]) <= col or maps[row][col] != 1:
                    continue
                
                # 오직 1인 경우만
                maps[row][col] = maps[x][y] + 1
                # print(maps)
                check_queue.append((row, col))
        
        return maps[len(maps)-1][len(maps[0])-1]
                
    answer = bfs(0,0)
    return -1 if answer == 1 else answer