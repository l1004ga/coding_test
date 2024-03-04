# class Solution:
#     def isPalindrome(s: str) -> bool:
#         s = s.lower() # 소문자로 변환
#         s = s.replace(" ", "")
#         s = "".join(filter(lambda ns : ns.isalnum(), s))
#         return s == s[::-1]

import re
    
class Solution:
    def isPalindrome(s: str) -> bool:

        s = re.sub('[^a-zA-Z0-9]', '', s)
        s = s.lower()

        return s == s[::-1]

print(Solution.isPalindrome(s="A man, a plan, a canal: Panama"))


"""
1. Input: s = "A man, a plan, a canal: Panama"
Output: true
Explanation: "amanaplanacanalpanama" is a palindrome.

2. Input: s = "race a car"
Output: false
Explanation: "raceacar" is not a palindrome.

3. Input: s = " "
Output: true
Explanation: s is an empty string "" after removing non-alphanumeric characters.
Since an empty string reads the same forward and backward, it is a palindrome.

"""