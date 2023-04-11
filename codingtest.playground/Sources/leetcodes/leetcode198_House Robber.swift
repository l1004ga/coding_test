import Foundation

class Solution {

    func rob(_ nums: [Int]) -> Int {
        var resultDict : [Int:Int] = [:]

        if nums.count <= 2 {
            return nums.max()!
        }

        resultDict[0] = nums[0]
        resultDict[1] = max(nums[0], nums[1])

        for i in 2...(nums.count - 1) {

            resultDict[i] = max(resultDict[i - 1]!, resultDict[i - 2]! + nums[i])
        }
        return resultDict[nums.count - 1]!

    }
}

class Solution {
    var resultDict : [Int:Int] = [:]
    var nums: [Int] = []
    func _rob(_ i: Int) -> Int {
        if i < 0 {
            return 0
        }
        
        if resultDict[i] != nil {
            return resultDict[i]!
        }
        
        resultDict[i] = max(_rob(i - 1), _rob(i - 2) + nums[i])
        return resultDict[i]!

    }
    func rob(_ nums: [Int]) -> Int {
        self.nums = nums
        return _rob(nums.count - 1)
    }
}



var sol = Solution()

print(sol.rob([2,1,1,2]))
print(sol.rob([2,1,1,2,2,1,1,2,2,1,1,2,2,1,1,2,2,1,1,2,2,1,1,2,2,1,1,2,2,1,1,2,2,1,1,2,2,1,1,2,2,1,1,2,2,1,1,2,2,1,1,2]))




