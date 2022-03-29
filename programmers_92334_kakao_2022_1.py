def solution(id_list, report, k):
    # 1. split reports by space ('reporter reportee')
    # 2. create 'reportee_set' containing sets of 'reporter's 
    
    ## 
    # 3. for reporter_set in reportee_set
    # 4.    if len(reporter_set) < k  --> delete!
    
    ##
    # id_list_dic = dictionary(id_list)
    # 5. for reporter_set in reportee_set.value
    # 6.    for reporter in reporter_set
    # 7.        id_list_dic[repoter] += 1
    # 8. return list(id_list_dic.values())


    dictionary = dict.fromkeys(id_list) 
    evr = []
    answer = []
    count = 0


    for i in id_list:
        all_set = set() 
        for j in report:
            evr = j.split()
            if i == evr[1]:
                a = dictionary[i]
                if a == None:
                    all_set.add(evr[0])
                else:
                    all_set = a
                    all_set.add(evr[0])
                dictionary[i] = all_set

    for key, value in dictionary.items():
        if value is not None:
            if len(value) < k:
                dictionary[key] = None

    for i in id_list:
        sum = 0
        for key, value in dictionary.items():
            value = dictionary[key]
            if value is not None:
                value = list(value)
                if i in value:
                    sum += 1
        answer.insert(count,sum)
        count += 1      

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

'''
#first code
dictionary = dict.fromkeys(id_list) 
    evr = []
    answer = []
    count = 0


    for i in id_list:
        all_set = set()
        for j in report:
            evr = j.split()
            if i == evr[1]:
                a = dictionary[i]
                if a == None:
                    all_set.add(evr[0])
                else:
                    all_set = a
                    all_set.add(evr[0])
                dictionary[i] = all_set

    for key, value in dictionary.items():
        if value is not None:
            if len(value) < k:
                dictionary[key] = None

    for i in id_list:
        sum = 0
        for key, value in dictionary.items():
            value = dictionary[key]
            if value is not None:
                value = list(value)
                if i in value:
                    sum += 1
        answer.insert(count,sum)
        count += 1      

    return answer
'''



'''
#second code
def solution(id_list, report, k):
    dictionary = dict.fromkeys(id_list) 
    evr = []
    answer = []
    count = 0
    k = 2


    for i in id_list:
        all_set = set()
        for j in report:
            evr = j.split()
            if i == evr[1]:
                a = dictionary[i]
                if a == None:
                    all_set.add(evr[0])
                else:
                    all_set = a
                    all_set.add(evr[0])
                dictionary[i] = all_set

#revise for loop 

    for i in id_list:
        sum = 0
        for key, value in dictionary.items():
            value = dictionary[key]
            if value is not None:
                    if len(value) >= k:
                        value = list(value)
                        if i in value:
                            sum += 1
        answer.insert(count,sum)
        count += 1      
        
    return answer
'''