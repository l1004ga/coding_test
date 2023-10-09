def solution(word):
    answer = 0
    
    for (i,w) in enumerate(word):
        if i == 0:
            if w == "A":
                answer += 1
            elif w == "E":
                answer += 781 + 1
            elif w == "I":
                answer += 781 * 2 + 1
            elif w == "O":
                answer += 781 * 3 + 1
            elif w == "U":
                answer += 781 * 4 + 1
        elif i == 1:
            if w == "A":
                answer += 1
            elif w == "E":
                answer += 156 + 1
            elif w == "I":
                answer += 156 * 2 + 1
            elif w == "O":
                answer += 156 * 3 + 1
            elif w == "U":
                answer += 156 * 4 + 1
        elif i == 2:
            if w == "A":
                answer += 1
            elif w == "E":
                answer += 31 + 1
            elif w == "I":
                answer += 31 * 2 + 1
            elif w == "O":
                answer += 31 * 3 + 1
            elif w == "U":
                answer += 31 * 4 + 1
        elif i == 3:
            if w == "A":
                answer += 1
            elif w == "E":
                answer += 6 + 1
            elif w == "I":
                answer += 6 * 2 + 1
            elif w == "O":
                answer += 6 * 3 + 1
            elif w == "U":
                answer += 6 * 4 + 1
        elif i == 4:
            if w == "A":
                answer += 1
            elif w == "E":
                answer += 2
            elif w == "I":
                answer += 3
            elif w == "O":
                answer += 4
            elif w == "U":
                answer += 5
        
    
    return answer
