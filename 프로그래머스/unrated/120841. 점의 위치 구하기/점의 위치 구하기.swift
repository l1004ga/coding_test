import Foundation

func solution(_ dot:[Int]) -> Int {
    
    //삼항연산자 이중 사용
    return dot[0] > 0 ? (dot[1] > 0 ? 1 : 4) : (dot[1] > 0 ? 2 : 3)
}