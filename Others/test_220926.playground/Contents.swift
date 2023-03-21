import Foundation

//코드1-1
/*
let nameOfTeam11: [String] = ["민경", "은노", "종현", "근섭", "예슬", "정훈", "준호", "진아"]
let nicOfTeam11: Array<String> = ["민", "은", "종", "근", "예", "정", "준", "진"]

func greetMessage(_ name:String) {
    print("\(name)님 환영합니다.")
}

for popName in nameOfTeam11 {
    greetMessage(popName)
}
*/

//코드2
/*
let nameOfTeam11: [String] = ["민경", "은노", "종현", "근섭", "예슬", "정훈", "준호", "진아"]

func greetMessage(_ nameArray:Array<String>){
    for popName in nameArray {
        print("\(popName)님 환영합니다.")
    }
}

greetMessage(nameOfTeam11)
*/

//코드3
/*
let nameOfTeam11: [String] = ["민경", "은노", "종현", "근섭", "예슬", "정훈", "준호", "진아"]

func greetMessage(_ nameArray:Array<String>,_ index:Int){
    let popName : String = nameArray[index]
        print("\(popName)님 환영합니다.")
}

greetMessage(nameOfTeam11,4)
*/


//코드4
/*
let nameOfTeam11: [String] = ["민경", "은노", "종현", "근섭", "예슬", "정훈", "준호", "진아"]

func greetMessage(_ nameArray:Array<String>,_ index:Int) -> String{
    return "\(nameArray[index])님 환영합니다."
}
print(greetMessage(nameOfTeam11,8))
*/
//코드4 변형(함수 input에 들어오는 index값이 범위를 벗어날 경우 예외처리 코드로 업그레이드 시켜봄)
/*
let nameOfTeam11: [String] = ["민경", "은노", "종현", "근섭", "예슬", "정훈", "준호", "진아"]

func greetMessage(_ nameArray:Array<String>,_ index:Int) -> String{
    return nameArray.indices ~= index ? "\(nameArray[index])님 환영합니다." : "Out of range"
}
print(greetMessage(nameOfTeam11,7))
*/

//코드5
/*
let nameOfTeam11: [String] = ["민경", "은노", "종현", "근섭", "예슬", "정훈", "준호", "진아"]

func greetMessage(_ nameArray:Array<String>,_ index:Int) -> (String, Int){
    return (nameArray[index], index)
}
let result = greetMessage(nameOfTeam11,4)
print("\(result.1)번에 위치하신 \(result.0)님 환영합니다")
*/

//코드6
/*
 let nameOfTeam11: [String] = ["민경", "은노", "종현", "근섭", "예슬", "정훈", "준호", "진아"]
 
 func greetMessage(_ names:String...){
 for popName in names {
 print("\(popName)님 환영합니다.")
 }
 }
 
 greetMessage("민경", "은노", "종현", "근섭", "예슬", "정훈", "준호", "진아")
 */
