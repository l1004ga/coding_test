import Foundation

//금융감독원에서 계좌에 대한 규정을 배포해서 프로토콜을 준수해야 함
protocol Account {
    var owner: String { get set }
    func displayOwner()
}

// 은행 계좌에 대한 클래스
class BankAccount {
    //프로퍼티
    //0. 프로토콜이 시켜서 만듦
    var owner: String = ""
    
    //1. 계좌번호
    //2. 남은 잔고 데이터
    
    var accountNum : Int = 0
    var accountBal : Float = 0.0
    
    //3. 수수료
    let fees : Float = 3.3
    
    //초기화
    init(number: Int, balance: Float){
        accountNum = number
        accountBal = balance
    }
    
    //프로토콜이 시켜서 만듦
    func displayOwnerName(){
        print("Owner name is \(owner)")
    }
    
    //현재 잔액에서 수수료를 빼는 값을 주고받을 때 새로 계산해주는 연산 프로퍼티
    var balLessFees: Float {
        get {
            return accountBal - fees
        }
        set {
            accountBal = newValue - fees                        //이해가 안되는데용... newValue 선언 안해도 되나요... 왜죠...
        }
    }
    
    
    //계좌 정보와 잔고를 출력하는 메소드
    func displayInformation() {
        print("Account Number = \(accountNum)")
        print("This account have \(accountBal)$")
    }
    //최대로 담을 수 있는 금액을 알려주는 클래스 메소드
    //인스턴스를 따로 만들어 초기화하지 않아도 실행해서 확인하게 해줘야 한다.
    
    class func getMaxBal() -> Float {
        return 100000.0
    }
}

//var kittyAccount = BankAccount()
//kittyAccount.accountNum = 111222333444
//kittyAccount.accountBal = 120.8
//kittyAccount.displayInformation()

var marimoAccount: BankAccount = BankAccount(number: 5423329874819472, balance: 92848.3)
marimoAccount.displayInformation()
print("Balance Less Fees = \(marimoAccount.balLessFees)$")
marimoAccount.balLessFees = 854.6
print("Balance Less Fees = \(marimoAccount.balLessFees)$")

marimoAccount.owner = "maria"
marimoAccount.displayOwnerName()
