import Foundation


func solution(_ numbers:[Int], _ hand:String) -> String {
    
    var resultArray : [String] = []
    var leftHandLocation : String = "*"
    var rightHandLocation : String = "#"
    
    var padDict : [String:[Int]] = ["1":[0,0],"2":[0,1],"3":[0,2],"4":[1,0],"5":[1,1],"6":[1,2],"7":[2,0],"8":[2,1],"9":[2,2],"*":[3,0],"0":[3,1],"#":[3,2]]
    
    
    for num in numbers {
        if num == 1 || num == 4 || num == 7 {
            resultArray.append("L")
            leftHandLocation = String(num)
        } else if num == 3 || num == 6 || num == 9 {
            resultArray.append("R")
            rightHandLocation = String(num)
        } else { // 2,5,8,0 일 경우
            let leftCheck = abs(padDict["\(num)"]![0] - padDict[leftHandLocation]![0]) + abs(padDict["\(num)"]![1] - padDict[leftHandLocation]![1])
            let rightCheck = abs(padDict["\(num)"]![0] - padDict[rightHandLocation]![0]) + abs(padDict["\(num)"]![1] - padDict[rightHandLocation]![1])
            
            if leftCheck < rightCheck {
                resultArray.append("L")
                leftHandLocation = String(num)
            } else if leftCheck > rightCheck {
                resultArray.append("R")
                rightHandLocation = String(num)
            } else { //같을 때
                if hand == "left" {
                    resultArray.append("L")
                    leftHandLocation = String(num)
                } else {
                    resultArray.append("R")
                    rightHandLocation = String(num)
                }
            }
        }
    }
    return resultArray.joined()
}