def power(alp,cop,cost,increase_alp,increase_cop,result_cost):
    alp += increase_alp
    cop += increase_cop
    result_cost += cost
    return alp, cop, result_cost


def solution(alp, cop, problems):
    answer = 0
    a = len(problems)
    result_cost = 0
    for i in range(a):
        first_alp = problems[i][0]
        first_cop = problems[i][1]
        if first_alp <= alp and first_cop <= cop:
            increase_alp = problems[i][2]
            increase_cop = problems[i][3]
            cost = problems[i][4]
            max_solve = increase_alp + increase_cop
            if max_solve > cost:
                power(alp,cop,cost,increase_alp,increase_cop,result_cost)
    print(max_alp, max_cop)
    return answer

alp = 10
cop = 10
problems = [[10,15,2,1,2],[20,20,3,3,4]]
solution(alp, cop, problems)
