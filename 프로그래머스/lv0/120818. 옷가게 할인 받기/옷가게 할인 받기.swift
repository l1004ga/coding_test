import Foundation

func solution(_ price:Int) -> Int {
    
    switch price {
    case 10..<100000 :
        return price
    case 100000..<300000 :
        return price * 95 / 100
    case 300000..<500000 :
        return price * 90 / 100
    case 500000...1000000 :
        return price * 80 / 100
    default :
        return price
    }
    
    return price
}