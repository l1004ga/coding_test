from pprint import pprint
def make_square(rectangle, place):
    
    for rec in rectangle:
        for y in range(rec[0],rec[2]+1):
            for x in range(rec[1], rec[3]+1):
                place[x][y] = 2 
                
    # pprint(place)

    
    return place     
 
def count_step(place, X, Y, endX, endY, count):

    if X < 0 or Y < 0 or X >= len(place) or Y >= len(place[X]) or place[X][Y] == 0 or place[X][Y] == 1:
        return
    
    if X + 1 < len(place) and Y + 1 < len(place[X]) and X - 1 >= 0 and Y - 1 >= 0:
        if (place[X+1][Y] in [1, 2]) and (place[X-1][Y] in [1, 2]) and (place[X][Y+1] in [1, 2]) and (place[X][Y-1] in [1, 2]) and (place[X-1][Y-1] != 0) and (place[X-1][Y+1] != 0) and (place[X+1][Y-1] != 0) and (place[X+1][Y+1] != 0):
            return

    if X == endX and Y == endY:
        
        place[X][Y] = 3
        global COUNTS
        COUNTS.append(count)
        # pprint(place)
        return count
    
    place[X][Y] = 1
    count += 1
    
    count_step(place, X+1, Y, endX, endY , count)
    count_step(place, X-1, Y, endX, endY, count)
    count_step(place, X, Y+1, endX, endY, count)
    count_step(place, X, Y-1, endX, endY, count)
    
           
COUNTS = []    

def solution(rectangle, characterX, characterY, itemX, itemY):
    global COUNTS
    COUNTS = []
    rectangle = list(map(lambda r: [r[0]*4,r[1]*4,r[2]*4,r[3]*4] , rectangle))
    characterX *= 4
    characterY *= 4
    itemX *= 4
    itemY *= 4
    place = [[0] * 250  for _ in range(0, 250)]
    square_place = make_square(rectangle, place)
    count = 0
    count_step(square_place, characterY, characterX, itemY, itemX, count)
    # print(COUNTS)

    return min(COUNTS) // 4