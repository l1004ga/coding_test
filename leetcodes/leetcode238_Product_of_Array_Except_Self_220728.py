def productExceptSelf(nums):
    left = []
    p = 1
    for i in range(0,len(nums)):
        left.append(p)
        p = p * nums[i]
    
    p = 1
    for j in range(len(nums)-1, -1, -1):
        left[j] = left[j] * p 
        p = p * nums[j]

    return left



nums = [1,2,3,4]
productExceptSelf(nums)
nums = [-1,1,0,-3,3]
productExceptSelf(nums)