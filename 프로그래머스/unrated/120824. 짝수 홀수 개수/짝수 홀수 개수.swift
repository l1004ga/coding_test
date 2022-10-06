import Foundation

func solution(_ num_list:[Int]) -> [Int] {
    var result : [Int] = []
    
    result.append(num_list.filter{$0 % 2 == 0}.count)
    result.append(num_list.filter{$0 % 2 != 0}.count)
    return result
}