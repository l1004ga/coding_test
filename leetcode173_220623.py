# 배열 문제

# 3번째, 딕셔너리(키) 사용 * 다시보기
def twoSum(self, nums: List[int], target: int) -> List[int]:
    dic = {}
    for label, value in enumerate(nums):
        dic[value] = label
        
    
    for label, value in enumerate(nums):
        if target - value in dic and label != dic[target - value]: #dic 전체에서 찾는데 같은 값이 있으면 안되기 때문
            return [label, dic[target-value]]



    
    

target = 6
[3,3]
dic = {3:0, 3:1}



nums = [2,7,11,15], target = 9
twoSum(nums, target)
nums = [3,2,4], target = 6
twoSum(nums, target)
nums = [3,3], target = 6
twoSum(nums, target)

# 1번째, 부르트 포스
def twoSum(self, nums: List[int], target: int) -> List[int]:
    for i in range(len(nums)):
        for j in range(i+1, len(nums)):
            if nums[i] + nums[j] == target:
                return [i, j]

# 2번째, target - nums 해서 값이 있는지 탐색 * 다시보기
def twoSum(self, nums: List[int], target: int) -> List[int]:
    for label, value in enumerate(nums):
        complement = target - value
        if complement in nums[label+1:]:
            return [nums.index(value), nums[label+1:].index(complement)+(label+1)]