# key point : nums.length == 2 * n 

def arrayPairSum(nums) -> int:
    sum = 0 
    nums.sort()

    for i in nums[::2]:
        sum = sum + i

    print(sum)
    return sum


nums = [1,4,3,2]
arrayPairSum(nums)
nums = [6,2,6,5,1,2]
arrayPairSum(nums)