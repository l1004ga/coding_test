import Foundation

func solution(_ n:Int, _ t:Int, _ m:Int, _ timetable:[String]) -> String {
    
    var arrivalTime : [Int] = [540]
    var lineTable : [Int] = []
    // 결과적으로 차에 탈 수 있는 사람들
    var finalTable : [Int] = []
    var finalNum : Int = 0
    // 셔틀 운행 시간표
    if n > 1 {
        for _ in 1...(n - 1) {
            arrivalTime.append(arrivalTime.last! + t)
        }
    }
    
    for n in timetable {
        let line = n.components(separatedBy: [":"])
        lineTable.append(Int(line[0])! * 60 + Int(line[1])!)
    }
//    print("왜이럼 ? \(lineTable)")
    
    arrivalTime.sort()
    lineTable.sort()
    lineTable.reverse()
    
//    print("for 문 전 : \(lineTable)")
    for s in arrivalTime {
        // 셔틀 출발 전까지 도착한 사람
        finalNum = 0
        var before = lineTable.filter({ $0 <= s })
//  print(before)
        if before.count != 0 {
            if before.count < m {
                for i in 1...before.count {
                    var last = before.popLast()
//                    print("버스 탄 사람 \(last)")
                    finalTable.append(last!)
                    lineTable.popLast()
                    finalNum += 1
                }
//                print("대기줄 현황 : \(lineTable)")
//                print("최종1 \(finalTable)")
            } else {
                for i in 1...m {
                    var last = before.popLast()
//                    print("버스 탄 사람 \(last)")
                    finalTable.append(last!)
                    lineTable.popLast()
                    finalNum += 1
                }
//                print("최종2 \(finalTable)")
            }
        }
    }
    
//    print("마지막 셔틀에 탄 사람 수 : \(finalNum)")
//    print("엥? \(m)")

//    print("최종으로 탄 사람들 : \(finalTable)")
//    print("셔틀 시간표 : \(arrivalTime)")

    finalTable.sort()
    
    if finalNum == m {
        if finalTable.last! < arrivalTime.last! {
//            print("1")
//            print("이게 중요 \(finalTable.filter({ $0 == finalTable.last! }))")
            if finalTable.count == finalTable.filter({ $0 == finalTable.last! }).count {
                return String("\( String((finalTable.last! - 1) / 60).count == 1 ? "0" + String((finalTable.last! - 1) / 60) : String((finalTable.last! - 1) / 60) ):\(            String((finalTable.last! - 1) % 60).count == 1 ? "0" + String((finalTable.last! - 1) % 60) : String((finalTable.last! - 1) % 60))")
            }
//            print("1-1")
            return String("\( String((finalTable.last! - 1) / 60).count == 1 ? "0" + String((finalTable.last! - 1) / 60) : String((finalTable.last! - 1) / 60) ):\(            String((finalTable.last! - 1) % 60).count == 1 ? "0" + String((finalTable.last! - 1) % 60) : String((finalTable.last! - 1) % 60))")
        }
        
//        print("2")
        return String("\( String((finalTable.last! - 1) / 60).count == 1 ? "0" + String((finalTable.last! - 1) / 60) : String((finalTable.last! - 1) / 60) ):\(            String((finalTable.last! - 1) % 60).count == 1 ? "0" + String((finalTable.last! - 1) % 60) : String((finalTable.last! - 1) % 60))")
    }
    
    if finalTable.count == 0 {
        return String("\( String((arrivalTime.last!) / 60).count == 1 ? "0" + String((arrivalTime.last!) / 60) : String((arrivalTime.last!) / 60) ):\(            String((arrivalTime.last!) % 60).count == 1 ? "0" + String((arrivalTime.last!) % 60) : String((arrivalTime.last!) % 60))")
    }
    
    if finalTable.last! < arrivalTime.last! {
//        print("3")
        return String("\( String((arrivalTime.last!) / 60).count == 1 ? "0" + String((arrivalTime.last!) / 60) : String((arrivalTime.last!) / 60) ):\(            String((arrivalTime.last!) % 60).count == 1 ? "0" + String((arrivalTime.last!) % 60) : String((arrivalTime.last!) % 60))")
    }
//    print("4")
    return String("\( String((finalTable.last!) / 60).count == 1 ? "0" + String((finalTable.last!) / 60) : String((finalTable.last!) / 60) ):\(            String((finalTable.last!) % 60).count == 1 ? "0" + String((finalTable.last!) % 60) : String((finalTable.last!) % 60))")
}