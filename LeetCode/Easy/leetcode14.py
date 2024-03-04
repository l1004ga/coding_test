class Solution:
    def longestCommonPrefix2(strs: list[str]) -> str:
        flag = strs[0]
        for s in strs[1:]:
            for (i,_) in enumerate(flag):
                if i == len(s):
                    flag = flag[:i] # 이게 없어야 된다고 생각하는대, 있어야 돌아감... why?
                    break

                if flag[i] != s[i]:
                    if i == 0:
                        return ""
                    else:
                        flag = flag[:i]
                        break
        return flag
    def longestCommonPrefix(strs: list[str]) -> str:
        # find shortest word

        short = strs[0]
        for l in strs[1:]:
            if len(l) < len(short):
                short = l

        # solution1
        short = min(strs, key=lambda _str: len(_str))

        # solution2, sorted is asending
        short = sorted(strs, key=lambda _str: len(_str))[0]

        #
        # for (index, char) in shortest_word
        #   check if char is same to str[index] in all strs, then push to Return_Value
        # return Return_Value     

        for i in range(len(short)):
            # all: when all of items is True, then True 
            if not all([_str[i] == short[i] for _str in strs]):
                return short[:i]
            continue

            # any([False, False, False]) # any: when any of items is True, then True 
            for s in strs:
                if s[i] != short[i]:
                    return short[:i]

        return short
    
print("1")
print(Solution.longestCommonPrefix(strs=["flower","flow","flight"]))
print("2")
print(Solution.longestCommonPrefix(strs=["ab", "a"]))
print("3")

'''
solution1: Trie
     f
     l
     o
     w(1)
     e   
     r(1) 
'''

'''
solution2: 
longest word' char: C 200
numboer of word:    N 200

O(C*N)
40000 = 40k = 4*10^4

1G = 10^9

for
    flower
    flow
    flight
'''