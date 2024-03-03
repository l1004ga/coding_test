class Solution:
    def longestCommonPrefix(self, strs: List[str]) -> str:
        flag = strs[0]
        for s in strs[1:]:
            for (i,f) in enumerate(flag):
                if i == len(s):
                    flag = flag[:i]
                    break

                if flag[i] != s[i]:
                    if i == 0:
                        return ""
                    else:
                        flag = flag[:i]
                        break
        return flag
                    
        