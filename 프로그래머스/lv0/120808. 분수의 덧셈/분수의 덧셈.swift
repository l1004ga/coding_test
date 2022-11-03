// (denum1 + denum2) / (num1 * num2)
//(분모 * 분모 = 분모, 분자1 * 분모2 + 분자2 * 분모 1 = 분자)

import Foundation

func gcd(_ a: Int, _ b: Int) -> Int {
    let mod: Int = a % b
    return 0 == mod ? min(a, b) : gcd(b, mod)
}

func solution(_ denum1:Int, _ num1:Int, _ denum2:Int, _ num2:Int) -> [Int] {
    
    var down : Int = num1 * num2
    var top : Int = (denum1 * num2) + (denum2 * num1)
    var resultGcd : Int = gcd(top, down)
    
    return [top/resultGcd, down/resultGcd]
}

