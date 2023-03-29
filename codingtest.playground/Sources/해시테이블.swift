// 해시 테이블 - 데이터 양에 관계 없이 빠른 처리를 가능하게 하기 위해서

/*
 1. 해시테이블의 핵심은 해시함수이다.
 (해시함수 : 입력값의 길이와 상관 없이 출력 값의 길이를 동일하게 만들어주는 역할을 하는 함수)
 
 2. 해시 함수를 사용해서 이렇게 길이를 동일하게 만드는 작업을 해싱이라고 부른다.
 
 3. 일반적인 해싱 알고리즘으로 '나눗셈 방식 사용 = 나머지를 반환'
 (h(x) = mod(x, m), 여기서 m은 해시 테이블의 길이인데 일반적으로 2의 멱수에 가깝지 않은 소수)
 
 4. 충돌 발생 시 해시테이블 구현 방식
 4-1. 개별체이닝
 - 연결리스트로 구현
 - 같은 해시값을 가지는 경우 해시 테이블에 연결리스트로 매핑
 - 대부분의 탐색은 O(1)이나 모든 해시값이 겹칠 경우 O(n)이 됨
 
 4-2. 오픈 어드레싱
 - 탐사를 통한 빈공간에 배정, 따라서 해시값과 일치하는 주소에 배정된다는 보장이 없음
 - 해시 테이블의 크기 만큼만 배정 가능함
 - 순차적 탐사를 하기 때문에 데이터들이 고르게 분포하지 않고 클러스터링이 발생하게 된다. -> 탐사 시간이 오래걸리고 전체적 해싱 효율이 떨어짐
 
 5. Swift의 딕셔너리도 해시테이블 자료구조를 활용해서 만들어 진 것이다. linear probing(선형탐사, 오픈 어드레싱)으로 충돌을 해결함
 */


import Foundation

//test("wobgrovw", 6)
class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var start : Int = 0
        var maxLength : Int = 0
        var used : [Character:Int] = [:]
        
        for (index, char) in s.enumerated() {
            start = max(used[char, default: -1] + 1, start)
            maxLength = max(maxLength, index - start + 1)
            used[char] = index
        }
        return maxLength
    }
//    func lengthOfLongestSubstring(_ s: String) -> Int {
//        let s_copy = Array(s)
//        var start : Int = 0
//        var maxLength : Int = 0
//        var used : [Character:Int] = [:]
//
//        for (index, char) in s.enumerated() {
//            if used[char] == nil {
//                used[char] = index
//                continue
//            }
//            maxLength = max(maxLength, index - start)
//            if char == s_copy[index-1] {
//                used = [:]
//                start = index
//                used[char] = index
//                continue
//            }
//            if used[char]! < start {
//                used[char] = index
//                continue
//            }
//            start = used[char]! + 1 // k = 1
//            used[char] = index
//        }
//        maxLength = max(maxLength, s.count - start)
//        return maxLength
//    }
}

//var solution = Solution()
//test("wobgrovw", 6)
//test("ckilbkd", 5)
//test("dvdf", 3)
//test("abcabcbb", 3)
//test("abba", 2)
//test("aab", 2)
//test("aa", 1)
//test("a", 1)
//
//func test(_ s: String, _ v: Int) {
//    if Solution().lengthOfLongestSubstring(s) == v {
//        print("\(s):\(v) - True")
//    } else {
//        print("\(s):\(v) - False, result: \(Solution().lengthOfLongestSubstring(s))")
//    }
//}
//
