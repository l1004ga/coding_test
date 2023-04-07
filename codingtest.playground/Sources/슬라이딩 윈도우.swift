/*
 슬라이딩 윈도우 - 일반 투표인터와는 달리, 고정된 크기를 가지고, 정렬 여부와 관계 없이 활용된다.
 
 */

// 1. 브루트포스 -> 타임 아웃

// 2. 일반 결과값

import Foundation

// 풀이 방법
// 1. 배열의 0번째 순서일 때 k 길이의 슬라이딩 윈도우를 기반으로 max값을 구하고 maxValue 배열에 담아준다.
// 2. 배열을 한칸씩 오른쪽으로 이동하면서 maxValue에 가장 마지막으로 들어온 직전값과, 현재 슬라이딩 윈도우 범위에 속해있지 않은 num -1 인덱스의 값을 비교해준다.
    // 2-1. 비교 시에 maxValue.last와 nums[num - 1] 값이 같은 경우 현재 범위에서 max 값이 사라지게 될 수 있기 때문에 현재 범위에서 max를 다시 구해준다.
    // 2-2. 비교 시에 maxValue.last와 nums[num - 1] 값이 다른 경우(무조건 maxValue.last가 nums[num - 1]보다 더 큰 경우만 존재), 현재 범위에 앞선 범위의 max 값이 속해 있기 때문에, maxValue.last와 현재 nums[num]의 값을 비교해서 더 큰 값을 추가해준다.
class Solution {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        
        var maxValue : [Int] = []
        
        for (num, _) in nums.enumerated() {
            
            if num == nums.count - k + 1 {
                break
            }
                
            if num == 0 {
                maxValue.append(nums[num...(num + k - 1)].max()!)
                continue
            }
            
            if maxValue.last! == nums[num - 1] {
                maxValue.append(nums[num...(num + k - 1)].max()!)
            } else {
                maxValue.append(max(maxValue.last!, nums[num + k - 1]))
            }
            
        }
        
        return maxValue
    }
}

var solution = Solution()

print(solution.maxSlidingWindow([1,3,-1,-3,5,3,6,7], 3))
