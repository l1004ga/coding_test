func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var answer: [String] = []

    
    // arr1, arr2를 2진수로 바꾸기
    for i in 0...(arr1.count - 1) {
        let f = (String(String(arr1[i], radix: 2)).count == n ? String(String(arr1[i], radix: 2)) : String(repeating: "0", count: n - String(arr1[i], radix: 2).count) + String(String(arr1[i], radix: 2))).map{Int(String($0))!}
        let s = (String(String(arr2[i], radix: 2)).count == n ? String(String(arr2[i], radix: 2)) : String(repeating: "0", count: n - String(arr2[i], radix: 2).count) + String(String(arr2[i], radix: 2))).map{Int(String($0))!}
//        print("==========================")
//        print("\(arr1[i])의 이진수 : \(f), \(arr2[i])의 이진수 : \(s)  ")
        
        var line : String = ""
        for j in 0...(n - 1) {
//            print("\(i+1)줄의 \(j)번째 원소비교")
//            print("f: \(f[j]),s: \(s[j])")
//
            line += ((f[j] | s[j]) != 0) ? "#" : " "
        }
//        print("==========================")
        answer.append(line)
        line = ""
    }
// print("결과 : \(answer)")
    return answer
}