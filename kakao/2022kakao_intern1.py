from typing import *
'''
1번 지표	라이언형(R), 튜브형(T)
2번 지표	콘형(C), 프로도형(F)
3번 지표	제이지형(J), 무지형(M)
4번 지표	어피치형(A), 네오형(N)
단, 점수가 같을 시, 사전순으로 리턴
'''

def insert_by(first_char, second_char, type_score, match_choices):
    if match_choices <= 3:
        type_score[first_char] += 4 - match_choices
        return
    elif match_choices == 4:
        return
    else:
        type_score[second_char] += match_choices - 4
        return

def solution(survey, choices):
    answer = ''
    type_score = {'A':0, 'N':0, 'J':0, 'M':0, 'C':0, 'F':0, 'R':0, 'T':0}
    length = len(survey)
    for i in range(length):
        first_char_survey = survey[i][0]
        second_char_survey = survey[i][1]
        match_choices = choices[i]
        insert_by(first_char_survey, second_char_survey, type_score,match_choices)
    answer += 'T' if type_score['R'] < type_score['T'] else 'R'
    answer += 'F' if type_score['C'] < type_score['F'] else 'C'
    answer += 'M' if type_score['J'] < type_score['M'] else 'J'
    answer += 'N' if type_score['A'] < type_score['N'] else 'A'
    print(answer)
    return answer

survey = ["AN", "CF", "MJ", "RT", "NA"]
choices = [5, 3, 2, 7, 5]
solution(survey, choices)
survey = ["TR", "RT", "TR"]	
choices = [7, 1, 3]	
solution(survey, choices)
survey = ["AN"]
choices = [5]
solution(survey, choices)
survey = ["AN", "NA"]
choices = [5, 4]
solution(survey, choices)