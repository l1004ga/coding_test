# 1. declare dic{num : Englishword}
# 2. check s[] is alpha
#       make list of index(start) tp index(emd)
#       make new string to input upper word
#       if stringis matched to dic(value)
#           input dic(key) to the answer list 
# 3. check s[] is digit
#        input s to the answer list 
def solution(s):
    dic_match = {'zero':0, 'one':1, 'two':2, 'three':3, 'four':4, 'five':5, 'six':6, 'seven':7, 'eight':8, 'nine':9}

    result = ""
    word = ""    
    for value in s:
        if value.isnumeric():
            result += value
            continue
        # alphabet
        word += value
        if word in dic_match:
            result += str(dic_match[word])
            word = ""
    return int(result)
'''    
    word_index = []
    result = []
    check = 0



    # PEP8
    for num, i in enumerate(s):
        if i.isalpha():
            word_index.append(i)
            continue
        while len(word_index) != 0:
            serch = ''.join(s for s in word_index[0:2])
            for key, val in dic_match.items():
                if serch in key:
                    del word_index[0:len(key)] 
                    result.append(val)
                    # print(key)
        result.append(i)


    while (len(word_index) != 0):
                serch = ''.join(s for s in word_index[0:2])
                for key, val in dic_match.items():
                    if serch in key:
                        del word_index[0:len(key)] 
                        result.append(val)


    answer = int(''.join(map(str, result)))

    return answer       
'''

print(solution('one4seveneight9eight'))
