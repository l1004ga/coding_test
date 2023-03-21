'''
시간초과를 할 것 같지만 일단 해봅니다.
1. n의 숫자만큼 배열(table)을 생성한다.
    for i in range(n):
        table.append(i)
2. cmd 분리(스페이스 기준)해서 딕셔너리 변환

    

'''
def go_one_step_upside(k, table):
    k -= 1
    return k
def go_one_step_downside(k, table):
    k += 1
    return k

def solution(n, k, cmd):
    '''
    n < 1m
    cmd < 200k
    '''
    answer = ''
    # p =  #k값의 변화를 담은 변수
    # z =  #Z를 수행할 때 사용(가장 뒤에 원소추출 pop)
    table = []
    r = []
    for i in range(n):
        table.append(i)
    # print(k)
    # 200k
    for single_command in cmd:
        single_command_splited = single_command.split()

        if single_command_splited[0] == 'D':
            move_count = int(single_command_splited[1])
            for _ in range(move_count):
                k = go_one_step_downside(k, table)
        elif single_command_splited[0] == 'C':
            # O(n) ~ 1m
            # O(log n)
            v = table[k]
            table.remove(table[k])
            r.append(v)
            if k == len(table):
                k = go_one_step_upside(k, table)
                print(k)
        elif single_command_splited[0] == 'U':
            move_count = int(single_command_splited[1])
            for _ in range(move_count):
                k = go_one_step_upside(k, table)
        elif single_command_splited[0] == 'Z':
            # O(n) ~ 1m
            target = r.pop()
            found = False
            for index, value in enumerate(table):
                if target < value:
                    found = True
                    break
            if found:
                table.insert(index, target)
                if index <= k:
                    k += 1
            else:
                table.append(target)
    # 200k * 1m ~ 200 10^3 * 10^6 = 2 10^12 k, m, g, t, 2t 연산량 -> 2g
    # 200k ~ 2 * 10^5                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
    print(table)
    answer = ['X'] * n
    for i in table:
        answer[i] = 'O'
    
    return ''.join(answer)


cmd = ["D 2","C", "C"]
print(solution(3, 0, cmd))