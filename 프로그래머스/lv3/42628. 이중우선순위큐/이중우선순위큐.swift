import Foundation

func solution(_ operations:[String]) -> [Int] {
    var data : [Int] = []
    for operation in operations {
        var op = operation.components(separatedBy: " ")
        if op[0] == "I" {
            data.append(Int(op[1])!)
        } else if operation == "D 1" {
            if let max = data.max() {
                if let index = data.firstIndex(of: max) {
                    data.remove(at: index)
                }
            }
        }
        else if operation == "D -1" {
            if let min = data.min() {
                if let index = data.firstIndex(of: min) {
                    data.remove(at: index)
                }
            }
        }
    }
    if data.count <= 0 {
        return [0,0]
    }
    return [data.max()!, data.min()!]
}