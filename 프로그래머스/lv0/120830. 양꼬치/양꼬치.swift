import Foundation

func solution(_ n:Int, _ k:Int) -> Int {
    return n / 10 > 0 ? (n * 12000 + 2000 * k - 2000 * ( n / 10 )) : n * 12000 + 2000 * k
}