import Foundation

//class Solution {
//    func hammingWeight(_ n: Int) -> Int {
//        return String(n, radix: 2).filter({ $0 == "1" }).count
//    }
//}

class Solution {
    func hammingWeight(_ n: Int) -> Int {
        var count : Int = 0
        var bianryN = n
        while bianryN > 0 {
            count += bianryN & 1
            bianryN = bianryN >> 1
        }
        return count
    }
}

print(Solution().hammingWeight(Int("00000000000000000000000000001011", radix: 2)!))
print(Solution().hammingWeight(Int("00000000000000000000000010000000", radix: 2)!))
print(Solution().hammingWeight(Int("11111111111111111111111111111101", radix: 2)!))

