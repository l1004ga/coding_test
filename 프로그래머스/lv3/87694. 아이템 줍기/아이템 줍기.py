from pprint import pprint
from collections import deque

def make_square(rectangle, place):
    
    for rec in rectangle:
        for y in range(rec[0],rec[2]+1):
            for x in range(rec[1], rec[3]+1):
                place[x][y] = 2 

    return place     
 
def count_step(place, X, Y, endX, endY, count, queue):

    if X < 0 or Y < 0 or X >= len(place) or Y >= len(place[X]) or place[X][Y] == 0 or place[X][Y] == 1:
        return
    
    if X + 1 < len(place) and Y + 1 < len(place[X]) and X - 1 >= 0 and Y - 1 >= 0:
        if (place[X+1][Y] in [1, 2]) and (place[X-1][Y] in [1, 2]) and (place[X][Y+1] in [1, 2]) and (place[X][Y-1] in [1, 2]) and (place[X-1][Y-1] != 0) and (place[X-1][Y+1] != 0) and (place[X+1][Y-1] != 0) and (place[X+1][Y+1] != 0):
            return

    if X == endX and Y == endY:
        
        place[X][Y] = 3
        global COUNTS
        COUNTS.append(count)
        return count
    
    place[X][Y] = 1
    count += 1
    
    queue.append((X+1, Y, count))
    queue.append((X-1, Y, count))
    queue.append((X, Y+1, count))
    queue.append((X, Y-1, count))
    
           
COUNTS = []    

def solution(rectangle, characterX, characterY, itemX, itemY):
    global COUNTS
    COUNTS = []
    rectangle = list(map(lambda r: [r[0]*2,r[1]*2,r[2]*2,r[3]*2] , rectangle))
    characterX *= 2
    characterY *= 2
    itemX *= 2
    itemY *= 2
    place = [[0] * 105  for _ in range(0, 105)]
    count = 0
    square_place = make_square(rectangle, place)
    
    step_queue = deque()
    step_queue.append((characterY, characterX, count))
    
    while step_queue:
        current_step = step_queue.popleft()
        v = count_step(square_place, current_step[0], current_step[1], itemY, itemX, current_step[2], step_queue)
        if v is not None:
            return v // 2
    # count_step(square_place, characterY, characterX, itemY, itemX, count)
    

    return 0