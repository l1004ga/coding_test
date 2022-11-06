import Foundation

func solution(_ array:[Int]) -> Int {
    var sortedArray : [Int] = array
    sortedArray = sortedArray.sorted()
    return sortedArray[sortedArray.count / 2]
}