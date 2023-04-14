import Foundation

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    
    var reporters : [String:[String]] = [:]
    var warning : [String:Int] = [:]
    var result : [Int] = []
    
    report.forEach {
        var eachReport = $0.components(separatedBy: " ")
        if reporters[eachReport[0], default : []].contains(eachReport[1]) != true {
            reporters[eachReport[0], default : []].append(eachReport[1])
            warning[eachReport[1], default : 0] += 1
        }
    }

    
    
    for i in id_list {
        if reporters[i] != nil {
            var count = 0
            for j in reporters[i, default : []] {
                if warning[j, default : 0] >= k {
                    count += 1
                }
            }
            result.append(count)
            continue
        }
        result.append(0)
    }
    
    return result
}