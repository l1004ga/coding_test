import Foundation

func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    
    var success : Int = 0
    var zero : Int = 0
    var resultArray : [Int] = []
    
    for i in lottos {
        
        if i == 0 {
            zero += 1
        } else {
            let result = win_nums.filter{ $0 == i }
            
            resultArray = resultArray + result
        }
    }
    
    success = resultArray.count
    let max = success + zero
    
    print([switchNum(count: max), switchNum(count: success)])
    return [switchNum(count: max), switchNum(count: success)]
}

func switchNum(count : Int) -> Int {
    switch count {
    case 6:
        return 1
    case 5:
        return 2
    case 4:
        return 3
    case 3:
        return 4
    case 2:
        return 5
    default:
        return 6
        
    }
}