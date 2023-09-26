def solution(answers):
    one = [1,2,3,4,5] * 2000
    two = [2, 1, 2, 3, 2, 4, 2, 5] * 1250
    three = [3, 3, 1, 1, 2, 2, 4, 4, 5, 5] * 1000
    
    one_score = 0
    two_score = 0
    three_score = 0
    
    for (i,a) in enumerate(answers):
        if a == one[i]:
            one_score += 1
        if a == two[i]:
            two_score += 1
        if a == three[i]:
            three_score += 1
        
    score_list = [one_score, two_score, three_score]
    max = sorted(score_list, reverse = True)[0]

    return [i+1 for (i, s) in enumerate(score_list) if s == max]