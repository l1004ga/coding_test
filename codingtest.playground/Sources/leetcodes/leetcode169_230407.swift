/*
분할 정복 : 다중 분기 재귀를 기반으로 하는 알고리즘 디자인 패러다임, 재귀를 사용하는 대표 알고리즘
-> 대표적 분할 정복 알고리즘 : 병합 정렬(merge sort)
*/

// O(n)이면 풀이 가능 할 것으로 예상함

import Foundation

class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        var numDict : [Int:Int] = [:]
        
        for i in nums {
            if numDict[i] == nil {
                numDict[i] = 1
            } else {
                numDict[i]! += 1
            }
            
            if numDict[i]! > nums.count / 2 {
                return i
            }
            
        }
        return 0
    }
}

var solution = Solution()

print(solution.majorityElement([3,2,3]))
print(solution.majorityElement([2,2,1,1,1,2,2]))
