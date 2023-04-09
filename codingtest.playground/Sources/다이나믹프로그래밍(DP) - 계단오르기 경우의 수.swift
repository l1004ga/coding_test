/*
 다이나믹 프로그래밍 : 문제를 작은 문제로 나누어 해결한 결과를 저장해뒀다가 나중에 큰 문제의 결과와 합하여 풀이하는 알고리즘.
 
 ** 중복된 하위 문제가 있는 경우 -> 다이나믹 프로그래밍으로 푼다.
 ** 중복된 문제가 아닌 경우는 분할 정복 알고리즘으로 풀이한다.
 
 */

// 계단오르기

class Solution {
    var stairResult : [Int:Int] = [:]
    
    func climbStairs(_ n: Int) -> Int {
        if n <= 2 {
            stairResult[n] = n
            return n
        }
        
        if stairResult[n] != nil {
            return stairResult[n]!
        }
        stairResult[n] = climbStairs(n - 1) + climbStairs(n - 2)
        return stairResult[n]!
    }
}

var sol = Solution()
print(sol.climbStairs(3))
