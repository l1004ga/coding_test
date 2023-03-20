import Foundation

func solution(_ new_id:String) -> String {
    
    // 1단계, 2단계
    var text : String = new_id.lowercased().replacingOccurrences(of: "[^a-z0-9-_.]", with: "", options: .regularExpression)
    
    // 3단계
    text = text.replacingOccurrences(of: "\\.+", with: ".", options: .regularExpression)
    
    // 4단계
    text = text.replacingOccurrences(of: "^\\.", with: "", options: .regularExpression)
    text = text.replacingOccurrences(of: "\\.$", with: "", options: .regularExpression)
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
        let lastvalue = text[text.index(before: text.endIndex)]
        while text.count < 3 {
            text.append(lastvalue)
        }
        print(text)
    }
    
    return text
}

