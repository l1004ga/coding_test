//import Foundation
//
//let nums = [-1,0,1,2,-1,-4]
//let output = [[-1,-1,2],[-1,0,1]]
//
//class Solution {
//    func threeSum(_ nums: [Int]) -> [[Int]] {
//        
//        var result : [[Int]] = []
//        var num = nums.sorted()
//        
//        for i in 0...(num.count - 2) {
//            
//            if i > 0 && num[i] == num[i-1] {
//                continue
//            }
//            
//            var left = i + 1
//            var right = (num.count - 1)
//            
//            while left < right {
//                var sum = num[i] + num[left] + num[right]
//                
//                if sum > 0 {
//                    right -= 1
//                } else if sum < 0 {
//                    left += 1
//                } else {
//                    result.append([num[i],num[left],num[right]])
//                    
//                    while left < right && num[left] == num[left+1] {
//                        left += 1
//                    }
//                    
//                    while left < right && num[right] == num[right-1] {
//                        right -= 1
//                    }
//                    
//                    left += 1
//                    right -= 1
//                }
//            }
//        }
//        
//        return result
//    }
//}
//
//let result = Solution()
//
//print(result.threeSum(nums))
