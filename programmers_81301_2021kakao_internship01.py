# 1. declare dic{num : Englishword}
# 2. check s[] is alpha
#       make list of index(start) tp index(emd)
#       make new string to input upper word
#       if stringis matched to dic(value)
#           input dic(key) to the answer list 
# 3. check s[] is digit
#        input s to the answer list 
        
s = 'one4seveneight9eight'
word_index = []
result = []
check = 0

#dic_match = {0:zero, 1:one, 2:two, 3:three, 4:four, 5:five, 6:six, 7:seven, 8:eight, 9:nine}
dic_match = {'zero':0, 'one':1, 'two':2, 'three':3, 'four':4, 'five':5, 'six':6, 'seven':7, 'eight':8, 'nine':9}


for num, i in enumerate(s):
    if (i.isalpha()) == True:
        word_index.append(i)
    else:
        while (len(word_index) != 0):
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
