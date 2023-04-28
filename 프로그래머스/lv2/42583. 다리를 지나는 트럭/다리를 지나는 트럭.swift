import Foundation

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var truck = truck_weights
    var CarsOnBridge : [Int] = []
    var CarsLocation : [Int] = []
    var count : Int = 0
    var BridgeWeight : Int = 0
    
    truck.reverse()
    
    while truck.count != 0 || CarsLocation.count != 0 {
        count += 1
        CarsLocation = CarsLocation.map({ $0 + 1 })
        
        if CarsLocation.contains(bridge_length + 1) {
            CarsLocation.reverse()
            CarsLocation.popLast()
            CarsLocation.reverse()
            
            CarsOnBridge.reverse()
            BridgeWeight -= CarsOnBridge.popLast()!
            CarsOnBridge.reverse()
//            print("차량 빠짐, 현재 시간 \(count)")
        }
        
        if !truck.isEmpty {
            if BridgeWeight + truck.last! <= weight {
                var turn : Int = truck.popLast()!
                CarsLocation.append(1)
                CarsOnBridge.append(turn)
                BridgeWeight += turn
//                print("차량 \(turn) 올라감, 현재 시간 \(count)")
            }
        }
    }
    return count
}