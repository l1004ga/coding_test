def solution(participant, completion):
    complete = {}
    temp = 0
    for p in participant:
        complete[hash(p)] = p
        temp += hash(p)
    for c in completion:
        temp -= hash(c)
    
    return complete[temp]
            


