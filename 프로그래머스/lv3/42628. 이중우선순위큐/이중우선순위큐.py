def solution(operations):
    data = []
    for op in operations:
        command, num = op.split()
        if command == "I":
            data.append(int(num))
        if op == "D 1":
            try:
                data.remove(max(data))
            except:
                pass
        if op == "D -1":
            try:
                data.remove(min(data))
            except:
                pass
    if data:
        return max(data), min(data)
    return 0, 0