import Foundation

func popFirstInputLast(input : [Int]) -> [Int] {
    var input = input
    input.reverse()
    var firstValue = input.popLast()
    input.reverse()
    input.append(firstValue!)
    return input
}

// 우선순위 큐
func solution(_ priorities:[Int], _ location:Int) -> Int {
    
    var priorities = priorities
    var indexNum : [Int] = []
    
    for (n,_) in priorities.enumerated() {
        indexNum.append(n)
    }
    
    var maxPriority : [Int] = []
    
    
    while priorities.count != 0 {
        var maxValue = priorities.max()
        var index = priorities.firstIndex(of: maxValue!)
        
        if index == 0 {
            priorities.reverse()
            priorities.popLast()!
            priorities.reverse()
            
            indexNum.reverse()
            maxPriority.append(indexNum.popLast()!)
            indexNum.reverse()
            
            continue
        }
        
        for _ in 0...index! - 1{
            priorities = popFirstInputLast(input: priorities)
            indexNum = popFirstInputLast(input: indexNum)
        }
        priorities.reverse()
        priorities.popLast()!
        priorities.reverse()
        
        indexNum.reverse()
        maxPriority.append(indexNum.popLast()!)
        indexNum.reverse()
    }
    return maxPriority.firstIndex(of: location)! + 1
}