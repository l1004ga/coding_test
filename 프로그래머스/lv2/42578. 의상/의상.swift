import Foundation

func solution(_ clothes:[[String]]) -> Int {
    var typeCount : [String:Int] = [:]
     
    for i in clothes {
        typeCount[i[1], default : 1] += 1
    }
    
    return typeCount.reduce(1, { $0 * $1.value }) - 1
}