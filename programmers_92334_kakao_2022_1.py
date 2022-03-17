def solution(id_list, report, k):
    answer = []
    return answer

def test(id_list, report, k, result):
    print('TEST')
    if solution(id_list, report, k) == result:
        print(f"[OK] input : {id_list}, {report}, {k} is {result}")
        return
    
    print(f"[Failed] input : {id_list}, {report}, {k} is not {result}")
    return

test(
    ["muzi", "frodo", "apeach", "neo"], 
    ["muzi frodo","apeach frodo","frodo neo","muzi neo","apeach muzi"], 
    2,
    [2,1,1,0]
)

test(
    ["con", "ryan"],
    ["ryan con", "ryan con", "ryan con", "ryan con"], 
    3,
    [0,0]
)


