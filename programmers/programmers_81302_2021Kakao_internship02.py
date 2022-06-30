'''
<manhattan distance>
    |x1 - x2| + |y1 - y2|
'''

# 1. Find All P(x,y) - find the coordinates of all P values
# 2. if Manhattan distance between all P vlaue <= 2:
#       if Manhattan distance == 2:
#           1) same x, diffrent y1, y2(y1<y2)
#               (x, y1 + 1) == X(partition is installed)->1
#           2) same y, diffrent x1, x2(x1<x2)
#               (x1 + 1, y) == X(partition is installed)->1
#           3) 
# 3. 


def solution(places):
    answer = []
    p_value = []
    for room_num in range(0,2): # waiting room 
        flag = 1
        p_value = [] 
        for row in range(5): # row of each waiting room
            for col in range(5):
                if places[room_num][row][col] == 'P':
                    p_value.append([row, col])
        # compare all P values in here
        for criteria in range(len(p_value)):
            for comparison in range(criteria+1, len(p_value)):
                if comparison is not len(p_value):
                    x_distance = abs(p_value[criteria][0] - p_value[comparison][0])
                    y_distance = abs(p_value[criteria][1] - p_value[comparison][1])
                    # print("---------------")
                    # print(p_value[criteria][0], p_value[criteria][1])
                    # print(p_value[comparison][0], p_value[comparison][1])
                    if x_distance + y_distance == 1:
                        print('거리가 1일때')
                        flag = 0
                    elif x_distance + y_distance == 2:
                        x = (p_value[criteria][0] + p_value[comparison][0]) / 2
                        y = (p_value[criteria][1] + p_value[comparison][1]) / 2
                        if x.is_integer() :
                            if places[room_num][int(x)][int(y)] != 'X':
                                print('직선거리 파티션없음')
                                flag = 0
                        else:
                            if places[room_num][p_value[criteria][0]][p_value[comparison][1]] != 'X' or places[room_num][p_value[comparison][0]][p_value[criteria][1]] != 'X':
                                print('대각선 자리 파티션없음')
                                flag = 0 #
        # print('2.', flag)
        answer.append(flag)
    print(answer)                


    return answer

a = [[
    "OOOOO",
    "OOOOO",
    "OXPOO",
    "OPXOO",
    "OOOOO"
    ], [
    "OOOOO",
    "OOXPO",
    "OOPXO",
    "OOOOO",
    "OOOOO"
    ], ["PXOPX", "OXOXP", "OXPOX", "OXXOP", "PXPOX"], ["OOOXX", "XOOOX", "OOOXX", "OXOOX", "OOOOO"], ["PXPXP", "XPXPX", "PXPXP", "XPXPX", "PXPXP"]]
solution(a)


'''
def solution(places):
    answer = []
    p_value = []
    for room_num in range(1): # waiting room 
        for row in range(5): # row of each waiting room
            for col in range(5):
                if places[room_num][row][col] == 'P':
                    p_value.append([row, col])
        # compare all P values in here
        for criteria in range(len(p_value)):
            # comparison = criteria + 1
            # while comparison != len(p_value):
            #     col_distance = abs(p_value[comparison][1] - p_value[comparison][1])
            #     print(row_distance, col_distance)
            for comparison in range(criteria+1, len(p_value)):
                if comparison is not len(p_value):
                    x_distance = abs(p_value[criteria][0] - p_value[comparison][0])
                    y_distance = abs(p_value[criteria][1] - p_value[comparison][1])
                    if x_distance + y_distance == 1:
                        answer.append(0)
                        break
                    elif x_distance + y_distance == 2:
                        print(p_value[criteria][0], p_value[comparison][0]
                        # <same row, diffrent col>
                        # if p_value[criteria][0] == p_value[comparison][0]:
                        #     if p_value[criteria][1] < p_value[comparison][1]:
                        #         find_col = p_value[criteria][1] + 1
                        #     else:
                        #         find_col = p_value[comparison][1] + 1
                        #     if places[room_num][p_value[criteria][0]][find_col] != 'X':
                        #         answer.append(0)
                        #         break
                        # elif p_value[criteria][1] == p_value[comparison][1]:
                        #     if p_value[criteria][0] < p_value[comparison][0]:
                        #         find_row = p_value[criteria][0] + 1
                        #     else:
                        #         find_row = p_value[comparison][0] + 1
                        #     if places[room_num][p_value[criteria][1]][find_row] != 'X':
                        #         answer.append(0)
                        #         break


        print(answer) 
                        # print(p_value[criteria][0],p_value[criteria][1])
                        # print(p_value[comparison][0],p_value[comparison][1])

        
        # print(p_value)

    return 0
'''