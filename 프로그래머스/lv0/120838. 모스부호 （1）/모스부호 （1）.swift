/*
 <새롭게 알게된 함수나 메서드>
 - split과 conponents는 똑같은 메서드 역할을 할 수 있는데 차이점은 split은 [SubString]을 반환하고 conponents는 String을 반환하기 때문에 한번에 형변환 없이 사용하는걸 사용했습니다.
 - 또한 두 메서드를 쓰면 모두 배열 형식으로 나오기 때문에 joined로 합쳐주어야 한다.
 
 //split 메서드
 "12345".split(separator: "2") // ["1", "345"]
 
 //components 메서드
 import Foundation  //Foundation 프레임워크 임포트 필요
 
 "12345".components(separatedBy: "2") // ["1", "345"]
 
 
 */
import Foundation

func solution(_ letter:String) -> String {

let morse : [String:String] = [
    ".-" : "a",
    "-..." : "b",
    "-.-." : "c",
    "-.." : "d",
    "." : "e",
    "..-." : "f",
    "--." : "g",
    "...." : "h",
    ".." : "i",
    ".---" : "j",
    "-.-" : "k",
    ".-.." : "l",
    "--": "m",
    "-." : "n",
    "---" : "o",
    ".--." : "p",
    "--.-" : "q",
    ".-." : "r",
    "..." : "s",
    "-" : "t",
    "..-" : "u",
    "...-" : "v",
    ".--" : "w",
    "-..-" : "x",
    "-.--" : "y",
    "--.." : "z"
]

var splitLetters = letter.components(separatedBy: " ")

var resultArray : [String] = []
for i in splitLetters {
    resultArray.append(morse[i]!)
}

    return resultArray.joined(separator: "")
}