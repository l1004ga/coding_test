import Foundation


func yyyyMMddToDaysFrom2000_01_01(_ yyyyMMdd: String) -> Int {
    let tmp = yyyyMMdd.components(separatedBy: ".")
    let y = Int(tmp[0])!
    let m = Int(tmp[1])!
    let d = Int(tmp[2])!
    
    return (y - 2000) * 28 * 12 + (m - 1) * 28 + (d - 1)
}

func solution(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    
    var result : [Int] = []
    var date : [Character:Int] = [:]
    var todayFrom20000101 : Int = yyyyMMddToDaysFrom2000_01_01(today)
    terms.forEach {
        var a = $0.components(separatedBy: " ")
        date[Character(a[0]), default: 0] = Int(a[1])!
    }
    
    for (n,i) in privacies.enumerated() {
        var p = i.components(separatedBy: " ")
        if yyyyMMddToDaysFrom2000_01_01(p[0]) + date[Character(p[1])]! * 28 <= todayFrom20000101 {
            result.append(n + 1)
        }
    }
  
    return result
}