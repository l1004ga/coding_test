/*
분할 정복 : 다중 분기 재귀를 기반으로 하는 알고리즘 디자인 패러다임, 재귀를 사용하는 대표 알고리즘
-> 대표적 분할 정복 알고리즘 : 병합 정렬(merge sort)
*/


// NSExpress가 컴파일러에서 오류남. 다른 코드 필요

class Solution {
    func diffWaysToCompute(_ expression: String) -> [Int] {

        func compute(_ left: [Int], _ right: [Int], _ operation: String) -> [Int] {

            var result : [Int] = []

            for l in left {
                for r in right {
                    var problem = NSExpression(format: "\(l)"+operation+"\(r)").expressionValue(with: nil, context: nil)
                    result.append(problem as! Int)
                }
            }
            return result
        }
        
        var resultArray : [Int] = []
        
        if Int(expression) != nil {
            return [Int(expression)!]
        }

        for (num, value) in expression.enumerated() {

            if value == "+" || value == "*" || value == "-" {
                let startIndex = expression.index(expression.startIndex, offsetBy: 0)// 사용자지정 시작인덱스
                let endIndex = expression.index(expression.startIndex, offsetBy: expression.count - 1)// 사용자지정 끝인덱스

                let left = self.diffWaysToCompute(String(expression[startIndex ... expression.index(expression.startIndex, offsetBy: num - 1)]))
                let right = self.diffWaysToCompute(String(expression[expression.index(expression.startIndex, offsetBy: num + 1) ... endIndex]))


                resultArray.append(contentsOf: compute(left, right, String(value)))

            }
        }
        return resultArray
    }
}

var sol = Solution()

sol.diffWaysToCompute("2*3-4*5")
