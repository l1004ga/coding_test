import Foundation

let paragraph = "Bob hit a ball, the hit BALL flew far after it was hit."
let banned = ["hit"]

let output = "ball"

class Solution {
    func mostCommonWord(_ paragraph: String, _ banned: [String]) -> String {
        
        var str : String = paragraph.lowercased().replacingOccurrences(of: "[^a-z ]", with: " ", options: .regularExpression)
        // 1. paragraph 소문자 만들기
        // 2. 모든 금지됨 스트링 제거
        let bannedSet = Set(banned)
        
//        // 3. 최대로 많은 값 찾기
//        var strToArray = str.split(separator: " ").filter({ !bannedSet.contains(String($0)) })
//        var best = 0
//        var resultString = ""
//
//        for word in strToArray {
//            if strToArray.filter{$0 == word}.count > best {
//                best = strToArray.filter{$0 == word}.count
//                resultString = String(i)
//            }
//        }
        var counters: [String:Int] = [:]
        str.split(separator: " ").filter({ !bannedSet.contains(String($0)) }).forEach{counters[String($0), default: 0] += 1}
        return counters.max(by: {$0.value < $1.value})!.key
    }
}

let result = Solution()

//print(result.mostCommonWord(paragraph, banned))
