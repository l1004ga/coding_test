def solution(array, commands):
    answer = []
    for c in commands:
        i = c[0]
        j = c[1]
        k = c[2]
        new_array = array[i-1:j]
        new_array.sort()
        answer.append(new_array[k-1])
    return answer