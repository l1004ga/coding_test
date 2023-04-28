import Foundation

func solution(_ s:String) -> Bool
{
    var stack : [Character] = []
    
    for i in s {
        if i == "(" {
            stack.append("(")
        } else if i == ")" {
            if stack.isEmpty {
                return false
            }
            stack.popLast()
        }
    }
    if stack.count == 0 {
        return true
    } else {
        return false
    }
}