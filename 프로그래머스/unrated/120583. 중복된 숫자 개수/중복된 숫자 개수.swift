import Foundation

func solution(_ array:[Int], _ n:Int) -> Int {

    return array.filter({value in return value == n}).count
}