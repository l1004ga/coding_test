/*
 비트연산자 XOR
 
 5^5^7^7^8^8^3^2^3^2 = 0 이됨
 
 */

import Foundation

class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var result : Int = 0
        for num in nums {
            result = result ^ num
        }
        
        return result
    }
}
