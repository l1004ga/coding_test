/*
 이진검색 - 정렬된 배열에서 타겟을 찾는 검색 알고리즘 -> 대표적 O(log n)연산
 로그 연산을 사용하면 항상 일정한 속도를 얻을 수 있기 때문에, 큰 배열에서 뒤쪽에 있는 값을 찾아야 하는경우는 로그를 고려하는 것이... 작은 경우에는 index를 쓰는게 빠르긴 하다...
 
 N = a^x
 
 loga N = x
 
 chat GPT가 Swift에도 binarySearch라는 모듈이 있다고 했지만, 내가 직접 찾은 결과 해당 모듈은 없는 듯 ;;
 
 */

import Foundation

// 반복 풀이
class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        
        var left : Int = 0
        var right : Int = nums.count - 1
        
        while left <= right {
            
            var mid = (left + right) / 2
            
            if nums[mid] < target {
                left = mid + 1
            } else if nums[mid] > target {
                right = mid - 1
            } else {
                return mid
            }
        }
        return -1
    }
}

var solution = Solution()

//print(solution.search([-1,0,3,5,9,12], 9))
print(solution.search([-1,0,3,5,9,12], 2))
