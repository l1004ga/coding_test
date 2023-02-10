import Foundation


func solution(_ rows:Int, _ columns:Int, _ queries:[[Int]]) -> [Int] {
    
    var resultArray : [[Int]] = []
    var lastnum : Int = 0
    var changeNum : [Int] = []
    
    var result : [Int] = []
    
    for row in 1...rows {
        var columnArray : [Int] = []
        for column in 1...columns {
            columnArray.append(lastnum + column)
        }
        lastnum += columns
        resultArray.append(columnArray)
    }
    
    for query in queries {
        // 배열 만들기
        
        // 좌표값은 값이 바껴도 변하지 않음
        let x1 = query[0]-1 //1
        let y1 = query[1]-1 //1
        let x2 = query[2]-1 //4
        let y2 = query[3]-1 //3
        
        let firstNumber : Int = resultArray[x1][y1]
        
        //y1 고정
        for x in x1...x2-1 {
            resultArray[x][y1] = resultArray[x+1][y1]
            changeNum.append(resultArray[x][y1])
        }
        
        //x2 고정
        for y in y1...y2-1{
            resultArray[x2][y] = resultArray[x2][y+1]
            changeNum.append(resultArray[x2][y])
        }
         
        //y2 고정
        for x in (x1...x2-1).reversed() {
            resultArray[x+1][y2] = resultArray[x][y2]
            changeNum.append(resultArray[x+1][y2])
        }
        
        //x1 고정
        for y in (y1...y2-1).reversed() {
            if y == y1 {
                resultArray[x1][y+1] = firstNumber
                changeNum.append(firstNumber)
            } else{
                resultArray[x1][y+1] = resultArray[x1][y]
                changeNum.append(resultArray[x1][y+1])
            }
        }
        
        result.append(changeNum.sorted().first!)
        
        changeNum = []
        
        
    }
    
    return result
}