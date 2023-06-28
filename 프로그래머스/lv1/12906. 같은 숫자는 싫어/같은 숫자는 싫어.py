def solution(arr):
    answer = []
    # [실행] 버튼을 누르면 출력 값을 볼 수 있습니다.
    print('Hello Python')
    items = {}
    for (id, item) in enumerate(arr):
        if id == 0:
            answer.append(item)
            continue
        if item == arr[id - 1]:
            continue
        answer.append(item)
    return answer