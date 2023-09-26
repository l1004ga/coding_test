from copy import deepcopy
ANSWER = [] 
COUNT = 0

def find_next_dest(tickets, start, answer):
    
    arrival = start
    
    global ANSWER
    global COUNT
    
    have_to_visit = []
    # print(f'length of tickets = {len(tickets)}')
    for (n,t) in enumerate(tickets):
        # print(f'tickets = {tickets}')
        # print(f'n = {n}, t = {t}')
        if t[0] == arrival:
            have_to_visit.append(n)
    
    # print(f'count rest of tickets = {len(have_to_visit)}')
    
    for h in have_to_visit:
        
        # print(f'ticket = {tickets}, list = {have_to_visit}, h = {h}, answer = {answer}')
        destination = tickets[h][1]
        new_answer = answer[:]
        new_answer.append(destination)
        new_tickets = tickets[:]
        del new_tickets[h]
        # print(f'new_tickets = {new_tickets}, length = {len(new_tickets)}, ')
        find_next_dest(new_tickets, destination, new_answer)
    
    if len(answer) == COUNT:
        ANSWER.append(answer)
    
    # print("실행됨")
    return
        

def solution(tickets):
    global ANSWER
    global COUNT
    answer = ["ICN"]
    COUNT = len(tickets) + 1
    find_next_dest(tickets, "ICN", answer)        
    return min(ANSWER)