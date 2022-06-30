def twoSum(nums, target: int):
    left, right = 0, len(nums)-1

    while left != right: # not left == right 똑같은거 아냐?
        if nums[left] + nums[right] > target:
            right -= 1
            print('1', left, right)
        elif nums[left] + nums[right] < target:
            left += 1
            print('2', left, right)
        else:
            print(left, right)
            return left, right



nums = [2,7,11,15]
target  = 9

twoSum(nums, target)
'''
def twoSum(nums, target: int):
    
    for n, value in enumerate(nums):
        check = target - value

        if check in nums[n+1:]:
            print(nums.index(value), nums[n+1:].index(check)+(n+1))
            return nums.index(value), nums[n+1:].index(check)+(n+1)
            
# n =1, vlaue = 2, check = 4, 

def twoSum(nums, target: int):
    
    nums_dic = {}

    for n, value in enumerate(nums):
        if target - value in nums_dic:
            print(nums_dic[target - value], n)
            return [nums_dic[target - value], n]
        nums_dic[value] = n
'''