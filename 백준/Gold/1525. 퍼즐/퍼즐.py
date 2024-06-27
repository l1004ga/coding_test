from collections import deque

# 퍼즐을 문자열 123456780로 정렬시킨다고 생각하자
puzzle = ""
for i in range(3):
    puzzle += "".join(list(input().split()))

# 현재 puzzle의 모습을 key로, 움직인 횟수를 value로 저장
visited = {puzzle:0}
q = deque([puzzle])

# 상하좌우로 0(빈칸)을 이동
dx = [-1, 1, 0, 0]
dy = [0, 0, -1, 1]
def bfs():
    while q:
        puzzle = q.popleft()
        cnt = visited[puzzle]
        z = puzzle.index('0') # 0(빈칸)의 위치
        
        if puzzle == '123456780':
            return cnt
        
        x = z // 3 # 2차원 배열의 행
        y = z % 3 # 2차원 배열의 열
        
        cnt += 1
        for i in range(4):
            nx = x + dx[i]
            ny = y + dy[i]
            if 0 <= nx <= 2 and 0 <= ny <= 2: # 이동 가능한 위치일 경우
                # nx, ny를 다시 리스트의 인덱스로 바꾸자
                nz = nx * 3 + ny
                puzzle_list = list(puzzle) # 원소 스와핑을 위해 문자열을 리스트로 바꾸자
                puzzle_list[z], puzzle_list[nz] = puzzle_list[nz], puzzle_list[z]
                new_puzzle = "".join(puzzle_list) # 딕셔너리를 위해 다시 문자열로
                
                # 방문하지 않았다면
                if visited.get(new_puzzle, 0) == 0:
                    visited[new_puzzle] = cnt 
                    q.append(new_puzzle)
                    
    return -1
                    
print(bfs())