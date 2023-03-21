import Foundation

class Sample {
  // 가변 프로퍼티 (우리가 보통 생각하는 것)
  var name: String = "Ned"

  // 불변 프로퍼티
  let country: String = "Korea"

  // 초기화 메서드
  init(name: String) {
    self.name = name
  }

  // 인스턴스 메서드 (우리가 보통 생각하는 것)
  func sayName() {
    print("My name is \(name)")
  }

  // 클래스 메서드 (생각 좀 해봐야 만들어볼만한 것)
  class func sayHello() {
    print("Hello")
  }
}

protocol Gender {
    var gender: String { get set }
}

// NextAge는 Sample을 상속 받고, Gender 프로토콜을 따라줘야 함
class NextAge: Sample, Gender {
  var gender: String = "Male"
}


Sample.sayHello()

var mySample = Sample(name: "Park")
// mySample.name = "Park"
// mySample.country = "AUS" - 문제 발생
mySample.sayName()
// mySample.sayHello() - 문제 발생

var nextHuman = NextAge(name: "HUMAN")
nextHuman.gender = "Non-Binary"
print("\(nextHuman.gender)")
