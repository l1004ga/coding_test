import Foundation

func solution(_ angle:Int) -> Int {
    
    switch angle {
        
        case 1...89 :
            return 1
        case 90 :
            return 2
        case 91...179 :
            return 3
        case 180 : 
            return 4 
        default:
            break
    }
    
    return 0
}