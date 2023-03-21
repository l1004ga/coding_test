def rotation(rc, count_row, count_col):
    x1 = 0
    y1 = 0
    x2 = count_row #3
    y2 = count_col #4

    tmp = rc[x1][y1]

    for k in range(x1,x2-1):
        test = rc[k+1][y1]
        rc[k][y1] = test
        print('1',rc)

    for k in range(y1,y2-1):
        test = rc[x2-1][k+1]
        rc[x2-1][k] = test
        print('2',rc)

    for k in range(x2-1,x1,-1):
        test = rc[k-1][y2-1]
        rc[k][y2-1] = test
        print('3',rc)

    for k in range(y2-1,y1,-1):
        test = rc[x1][k-1]
        rc[x1][k] = test
        print('4',rc)

    rc[x1][y1+1] = tmp
    return rc

def shift_row(rc,count_row,count_col):
    l = rc[-1]
    for i in range(count_row - 1, 0, -1):
        rc[i] = rc[i - 1]
    rc[0] = l
    print(rc)
    return rc
    

def solution(rc,operations):
    answer = [[]]
    count_row = len(rc)
    count_col = len(rc[1])

    for excution in operations:
        if excution == 'Rotate':
            rotation(rc, count_row, count_col)
        elif excution == 'ShiftRow':
            shift_row(rc,count_row,count_col)
    answer = rc
    return answer

rc = [[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12]]
operations = ['Rotate',"ShiftRow", 'Rotate',"ShiftRow"]
solution(rc, operations)