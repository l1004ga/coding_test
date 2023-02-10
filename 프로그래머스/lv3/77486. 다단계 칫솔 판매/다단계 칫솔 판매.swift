import Foundation

func solution(_ enroll:[String], _ referral:[String], _ seller:[String], _ amount:[Int]) -> [Int] {
    var users: [String:Node] = [:]
    let root = Node(name: "-") //센터 노드를 지정해줌(enroll에 없음)
    users["-"] = root
    
    // 노드 생성
    for (num,person) in enroll.enumerated() {
        var connet = Node(name: person) //enroll에 이름으로 생성 된 노트
        users[person] = connet //노드를
        users[referral[num]]!.childAdd(child: connet)
    }
    
    // 노드에 값을 넣어줌
    for (num,sellerName) in seller.enumerated() {
            users[sellerName]?.finalSales(money: amount[num] * 100)
    }
    
    return enroll.map{ users[$0]!.salesMoney }
}

class Node {
    var name : String //판매자이름
    var salesMoney : Int = 0
    var children: [Node] = []
    var parent: Node? //최상위 노드는 부모가 없을 수 있기 때문에 옵셔널로 지정
    
    init(name: String) {
        self.name = name
        
    }
    
    func childAdd(child: Node) {
        children.append(child)
        child.parent = self //생성하는 자식 노드의 부모 노드는 스스로를 지정함
    }
    
    func finalSales(money: Int) {
        if money == 0 {
            return
        }
        
        if parent != nil {
            salesMoney += money - (money * 1 / 10)
            parent!.finalSales(money: money * 1 / 10)
        } else {
            salesMoney += money
        }
    }
}