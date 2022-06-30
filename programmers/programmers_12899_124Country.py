def solution(n):
    answer = ''
    return answer

def test(input, output):
    if solution(input) == output:
        print(f"[OK] input : {input} is {output}")
        return
    
    print(f'[FAILED] input : {input} is not {output}')
    return
    
test(1, 1)
test(2, 2)
test(3, 4)
test(4, 11)