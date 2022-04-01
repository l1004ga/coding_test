# target = 6
# nums = [3,2,4]

# class Solution:
#     def twoSum(self, nums: List[int], target: int) -> List[int]: #def 뒤 ->는 해당 함수의 리턴값이 어떤형태인지 알려주기 위한 코드이다.
#         for i in range(len(nums)):
#             for j in range(i+1,len(nums)):
#                 if (nums[i] + nums[j]) == target:
#                     return [i,j]

# answer = Solution()
# print(answer.twoSum)

# from typing import TypeVar

# T = TypeVar('T')
# U = TypeVar('U')

nums = [11,15,2,7]
target = 9

for i, n in enumerate(nums):
    complement = target - n
    print(nums[i+1])

    if complement in nums[i+1:]:    
        print('정답', nums.index(n), nums[i+1:].index(complement)+(i+1))