class Solution:
    def isPalindrome(self, s: str) -> bool:
        s = s.replace(' ', '')
        s = s.replace('.', '')
        s2 = ''.join(filter(str.isalnum, s)) 
        s3 = s2.lower()
        l = (len(s3) // 2)

        left = 0
        right = -1
        

        if (not s) or (l == 0) :
            return True
        else:
            while left < l:
                if s3[left] == s3[right]:
                    right -= 1
                    left += 1
                    if left == l:
                        return True
                        
                else:
                    return False
                    break