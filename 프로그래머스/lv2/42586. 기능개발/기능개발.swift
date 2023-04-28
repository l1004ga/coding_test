import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    
    var workingDays : [Int] = []
    var result : [Int] = []
    
    for num in 0...progresses.count - 1 {
        workingDays.append((100 - progresses[num]) / speeds[num] + ((100 - progresses[num]) % speeds[num] != 0 ? 1 : 0))
    }
    
    while workingDays.count > 0 {
        var first : Int = workingDays.first!
        var count : Int = 1
        
        // 마지막에 한개의 업무만 남았을 때
        if workingDays.count <= 1 {
            workingDays = []
            result.append(count)
            break
        }
        
        for i in 1...workingDays.count - 1 {
            if first >= workingDays[i] {
                count += 1
                if i == workingDays.count - 1 {
                    for _ in 1...count {
                        workingDays.popLast()
                    }
                    result.append(count)
                    break
                }
            } else {
                workingDays.reverse()
                for _ in 1...count {
                    workingDays.popLast()
                }
                workingDays.reverse()
                result.append(count)
                break
            }
        }
    }
    
    return result
    
}