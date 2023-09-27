from itertools import permutations

def solution(k, dungeons):
    
    visit_order = []
    max_visit = 0
    for i in permutations(dungeons, len(dungeons)):
        visit_order.append(i)
     
    for group in visit_order:
        user_energy = k
        visit_count = 0
        for n in group:
            # print(n)
            if n[0] <= user_energy:
                visit_count += 1
                user_energy -= n[1]
                # print(user_energy)
            else:
                break
        # print(visit_count)
        max_visit = max(max_visit, visit_count)

    return max_visit