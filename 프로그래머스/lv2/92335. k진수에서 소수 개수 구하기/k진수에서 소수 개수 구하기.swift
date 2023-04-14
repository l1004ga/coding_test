import Foundation

func isPrime(num : Int) -> Bool {
    if num < 4 {
        return num == 1 ? false : true
    }
    for i in 2...Int(sqrt(Double(num))) {
        if num % i == 0 {
            return false
        }
    }
    return true
}

func solution(_ n:Int, _ k:Int) -> Int {
    
    var nTok : String = String(n, radix: k)
//    print("진수 변한 : \(nTok)")
    var count : Int = 0
    var nTokArray = nTok.components(separatedBy: "0")
    nTokArray = nTokArray.filter({ $0 != "" })
    
    for i in nTokArray {
        var a = Int(String(i))!
        if isPrime(num: Int(String(i), radix: 10)!) == true {
            count += 1
        }
    }
    return count
}