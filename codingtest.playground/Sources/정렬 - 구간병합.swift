class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        
        var sortedArray : [[Int]] = intervals.sorted(by: {
            
            if $0[0] == $1[0] {
                return $0[1] < $1[1]
            }
            
             return $0[0] < $1[0]
                
                
        })
        var mergedArray : [[Int]] = []
        //mergedArray에서 비교 위치 파악을 위해서
        var location : Int = 0
        
      // testcase([[2,3],[2,2],[3,3],[1,3],[5,7],[2,2],[4,6]], [[1,3],[4,7]])
        print(sortedArray)
        
        for item in sortedArray { // 1, [2,6]
            if mergedArray.isEmpty {
//                print("1들어가는 값 : \(item)")
                mergedArray.append(item) //[1,3]
                continue
            }
            
            if mergedArray[location][1] >= item[0] {
//                print("2들어가는 값 : \(item)")
                if mergedArray[location][1] < item[1] {
                    mergedArray[location][1] = item[1]
//                    print("병합된 값 : \(mergedArray)")
                }
//                else {
//                    mergedArray[location][1] = item[1]
//                    print("병합된 값 : \(mergedArray)")
//                }
            } else {
//                print("3들어가는 값 : \(item)")
                mergedArray.append(item)
                location += 1
            }
            
            
        }

        
        return mergedArray
    }
}


var solution = Solution()

testcase([[1,3],[2,6],[8,10],[15,18]], [[1,6],[8,10],[15,18]])
testcase([[1,4],[4,5]], [[1,5]])
testcase([[2,3],[2,2],[3,3],[1,3],[5,7],[2,2],[4,6]], [[1,3],[4,7]])
testcase([[1,4],[2,3]], [[1,4]])


func testcase(_ intervals : [[Int]], _ output : [[Int]]) {
    if solution.merge(intervals) == output {
        print("true : \(solution.merge(intervals)) == \(output)")
    } else {
        print("false : \(solution.merge(intervals)) != \(output)")
    }
    
}
