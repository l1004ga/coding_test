import Foundation

func solution(_ dartResult:String) -> Int {
    
    var input = dartResult.replacingOccurrences(of: "10", with: "t")
    
    var stepResult : [Int] = []
    var stepNum : Int = 0
    
    for i in input {
        if i == "*" || i == "#" {
            if i == "*" {
                if stepResult.count >= 2 {
                    var lastTwo : [Int] = []
                    lastTwo.append(stepResult.popLast()!)
                    lastTwo.append(stepResult.popLast()!)
                    lastTwo = lastTwo.map({ $0 * 2 })
                    stepResult.append(lastTwo[1])
                    stepResult.append(lastTwo[0])
                } else {
                    stepResult.append(stepResult.popLast()! * (2))
                }
            } else if i == "#" {
                stepResult.append(stepResult.popLast()! * (-1))
            }
            continue
        }
        
        if i.isNumber == true || i == "t" {
            
            if i == "t" {
                stepNum = 10
            } else {
                stepNum = Int(String(i))!
            }
            continue
        }

        switch i {
        case "S" :
            stepResult.append(Int(pow(Double(stepNum),Double(1))))
        case "D" :
            stepResult.append(Int(pow(Double(stepNum),Double(2))))
        case "T" :
            stepResult.append(Int(pow(Double(stepNum),Double(3))))
        default :
            break
        }
    }
    
    return stepResult.reduce(0, +)
}