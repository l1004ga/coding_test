import Foundation

//스택 - 배열의 연장선

class Solution {
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        var result : [Int] = Array(repeating: 0, count: temperatures.count)
        var index : [Int] = []
        
        // n
        for i in 0...temperatures.count-1 {
            while !index.isEmpty && temperatures[index.last!] < temperatures[i] {
                result[index.last!] = i - index.last!
                index.popLast()
            }
            index.append(i)
        }
        return result
    }
}

//let solution = Solution()

//solution.dailyTemperatures([73,74,75,71,69,72,76,73])
