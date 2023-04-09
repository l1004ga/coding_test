/*
 다이나믹 프로그래밍 : 문제를 작은 문제로 나누어 해결한 결과를 저장해뒀다가 나중에 큰 문제의 결과와 합하여 풀이하는 알고리즘.
 
 ** 중복된 하위 문제가 있는 경우 -> 다이나믹 프로그래밍으로 푼다.
 ** 중복된 문제가 아닌 경우는 분할 정복 알고리즘으로 풀이한다.
 
 */

/*
 피보나치 수열을 아래와 같이 일반적인 재귀로 풀이할 경우
 모든 회차당 약 O(2^n) 연산이 소요됨
 
 func fib(_n: Int) -> Int {
     if n <= 1 {
         return n
     }
     
     return fib(_n: n - 1) + fib(_n: n - 2)
 }
*/
 
// 1. 피보나치수 - 메모이제이션(하향식 풀이, 가장 일반적), O(n)
// 일반 재귀와 다른 점은 이미 계산한 값은 저장해 두었다가 바로 리턴함

import Foundation

class Solution {

    var resultDict : [Int:Int] = [:]

    func fib(_ n: Int) -> Int {
        if n <= 1 {
            return n
        }
        if resultDict[n] != nil {
            return resultDict[n]!
        }
        resultDict[n] = fib(n - 1) + fib(n - 2)

        return resultDict[n]!
    }
}

// 2. 피보나치수 - 타뷸레이션(상향식, 반복을 사용하여 가장 작은 값부터 계산 후 저장), O(n)

class Solution {

    var resultDict : [Int:Int] = [0:0, 1:1]

    func fib(_ n: Int) -> Int {

        if n <= 1 {
            return n
        }

        for i in 2...n {
            resultDict[i] = resultDict[i - 1, default: 0] + resultDict[i - 2, default: 0]
        }
        return resultDict[n]!
    }
}

 // 3. 피보나치수열 그대로 계산

class Solution {
    func fib(_ n: Int) -> Int {
        
        if n <= 1 {
                    return n
                }
        
        var x : Int = 0
        var y : Int = 1
        
        for i in 0...n - 2 {
            (x, y) = (y, y + x)
        }

        return y
    }
}
 
 
var sol = Solution()

print(sol.fib(2))
