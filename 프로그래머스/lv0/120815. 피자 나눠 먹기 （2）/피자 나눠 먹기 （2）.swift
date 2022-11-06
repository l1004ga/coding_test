//피자 조각수 : 6과, 나눠먹을 사람 : N명의 최소공배수를 곱해줘야 한다.

import Foundation

//최소공배수

func gcd(_ a: Int, _ b: Int) -> Int {
    let mod: Int = a % b
    return 0 == mod ? min(a, b) : gcd(b, mod)
}

func lcm(_ a: Int, _ b: Int) -> Int {
    return a * b / gcd(a, b)
}

func solution(_ n:Int) -> Int {
    
    return lcm(6,n) / 6
}