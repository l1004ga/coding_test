/*
 그리디 알고리즘
 ** 그리디 알고리즘이 잘 작동하는 문제 : 탐욕 선택 속성(앞 선택이 이후 선택에 영향을 주지 않는 것 -> 선택을 다시 고려하지 않음), 최적 부분 구조
 ** 다익스트라 알고리즘은 대표적인 그리디 알고리즘의 예

 -> 그리디와 다이나믹프로그래밍(DP)의 차이점 : 그리디는 최적 부분 구조 문제를 푼다. DP는 하위 문제에 대한 최적 솔류선을 찾은 다음 결과를 합하여 전역 최적 솔루션을 선택한다면, 그리디는 이와 반대로 각 단계마다 최적해를 찾아서 문제를 더 작게 줄여나가는 형태이다.
*/

// 배낭문제 - 짐을 쪼갤 수 있는 경우 = 그리디 알고리즘
// 이 경우 단가(1kg당 가격)이 높은 순으로 짐을 채워 넣으면 된다.

import Foundation

class Solution {
    func knapsack(_ cargo: [(Int, Int)], _ capacity : Int) -> Float {
        var pack : [(Float, Int, Int)] = []
        var volume = capacity
        var totalValue : Float = 0.0
        // 단가 계산 = 가격(c[0]) / 무게(c[1])
        for c in cargo {
            pack.append((Float(c.0) / Float(c.1), c.0, c.1))
        }

        pack.sort(by: >)
        print(pack)

        for p in pack {
            // 짐을 온전히 다 넣을 수 있는 경우
            if volume - p.2 >= 0 {
                volume -= p.2
                totalValue += Float(p.1)
            }
            // 짐을 쪼개서 넣어야 하는 경우
            else {
                totalValue += (Float(volume) * p.0)
                break
            }
        }
        return totalValue
    }
}

// cargo : (가격, 무게)
var cargo : [(Int, Int)] = [
    (4, 12),
    (2, 1),
    (10, 4),
    (1, 1),
    (2, 2)
]

var solution = Solution()

print(solution.knapsack(cargo, 15))


