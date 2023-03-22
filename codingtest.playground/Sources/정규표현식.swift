import Foundation

func solution(_ new_id:String) -> String {

    // 1단계, 2단계
    var text : String = new_id.lowercased().replacingOccurrences(of: "[^a-z0-9-_.]", with: "", options: .regularExpression)

    // 3단계
//    text = text.replacingOccurrences(of: "\\.+", with: ".", options: .regularExpression)
    text = text.replacingOccurrences(of: "\\.{1,}", with: ".", options: .regularExpression)
    // * asterisk 는 앞에 표현이 있든 없든 매칭
    // 12345544..311131231..2322323
//    text = text.replacingOccurrences(of: "1\\.*2", with: ".", options: .regularExpression)
//    text = text.replacingOccurrences(of: "\\.{0,}", with: ".", options: .regularExpression)



    // 4단계
    text = text.replacingOccurrences(of: "(^\\.|\\.$)", with: "", options: .regularExpression)
    //text = text.replacingOccurrences(of: "\\.$", with: "", options: .regularExpression)
    print(text)

    if text == "" {
        text = "a"
    }

    if text.count >= 16 {
        let endIndex = text.index(text.startIndex, offsetBy: 14)
        let range = ...endIndex
        text = String(text[range])
        text = text.replacingOccurrences(of: "\\.$", with: "", options: .regularExpression)
        print(text)
    } else if text.count <= 2 {
//        let lastvalue = text[text.index(before: text.endIndex)]
// a       while text.count < 3 {
//            text.append(lastvalue)
//        }
        text += String(text.last!)
        print(text)
    }

    return text
}

//solution("...!@BaT#*..y.abcdefghijklm")
//solution("lm")
// 아이디 3~15자 사이
// 알파벳 소문자, 숫자, -, _, . 만 가능
// .는 처음 끝 사용 불가
// . 연속 사용 불가
