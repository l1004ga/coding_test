/*
 힙 - 정렬 구조가 아님
 
 우선순위 큐(ADT) 구현체  = 힙(완전이진트리) -> 따라서 힙은 우선순위에 해당하는 것이 루트이고, 이를 반환하도록 설계된 것이다.
 힙의 구현은 주로 배열로 구현함
 
 * 완전이진트리 : 마지막 레벨을 제외한 모든 노드가 채워져 있으며, 마지막 노드는 왼쪽부터 채워져있다.
 
 트리의 배열 표현의 경우 계산상 인덱스는 1부터 시작
 
 
 
 */

import Foundation

class BinaryHeap {
    
    var items : [Int]
    
    init() {
        // 0번째 인덱스는 사용하지 않는 것으로 함 -> 트리의 배열 표현의 경우 계산상 인덱스는 1부터 시작
        self.items = [-1]
    }
    
    func count() -> Int {
        // 0번재 인덱스는 사용하지 않기에 전체 크기에서 0번을 제외하기 위해서 -1을 해줌
        return self.items.count - 1
    }
    
    private func percolateUp() {
        var target : Int = self.count()
        var parent : Int = target / 2  // 무조건 마지막에 들어온 값에서 2를 하면 해당하는 부모 노드를 찾을 수 있음
        
        while parent > 0 {
            if self.items[target] < self.items[parent] {
                self.items.swapAt(target, parent)
            }
            target = parent
            parent = target / 2
        }
    }
    
    func insert(inValue : Int) {
        self.items.append(inValue)
        self.percolateUp()
    }
    
    // root 값을 꺼내준다.
    func pop() -> Int {
        self.items.swapAt(1, self.items.count - 1)
        //        swap(&self.items[1], &self.items[self.items.count - 1])
        let popItems : Int = self.items.popLast()!
        self.percolateDown()
        return popItems
    }
    // 1. out of range 검사
    // 2. inplace 여부 검사 -
    //   2.1. 두 자식 보다 부모가 더 작을 경우 -> 종료
    //.  2.2. 두 자식 중 한 자식만 더 작을 경우 -> 그 한 자식과 교환 후 1부터 다시 시작
    //.  2.3. 두 자식 중 두 자식 모두 작을 경우 -> 더 작은 쪽 자식과 교환 후 1부터 다시 시작
    private func percolateDown() {
        var parent : Int = 1
        var left : Int = parent * 2
        var right : Int = parent * 2 + 1
        
        while parent < self.items.count / 2 {
            // 두 자식 모두 부모보다 큰 경우
            if self.items[parent] < self.items[left] && self.items[parent] < self.items[right]  {
                return
            }
            // 두 자식 모두 부모보다 작을 경우
            if self.items[parent] > self.items[left] && self.items[parent] > self.items[right] {
                // 더 작은 숫자의 자식과 교환
                if self.items[left] < self.items[right] {
                    self.items.swapAt(parent, left)
                    parent = left
                    left = parent * 2
                    right = parent * 2 + 1
                } else {
                    self.items.swapAt(parent, right)
                    parent = right
                    left = parent * 2
                    right = parent * 2 + 1
                }
                continue
            }
            
            if self.items[parent] > self.items[left] || self.items[parent] > self.items[right] {
                if self.items[parent] > self.items[left] {
                    self.items.swapAt(parent, left)
                    parent = left
                    left = parent * 2
                    right = parent * 2 + 1
                } else {
                    self.items.swapAt(parent, right)
                    parent = right
                    left = parent * 2
                    right = parent * 2 + 1
                }
            }
        }
        
        print(self.items)
    }
}


var binaryHeap = BinaryHeap()

binaryHeap.insert(inValue: 33)
binaryHeap.insert(inValue: 17)
binaryHeap.insert(inValue: 27)
binaryHeap.insert(inValue: 14)
binaryHeap.insert(inValue: 18)
binaryHeap.insert(inValue: 19)
binaryHeap.insert(inValue: 21)
binaryHeap.insert(inValue: 9)
binaryHeap.insert(inValue: 11)
binaryHeap.insert(inValue: 5)

print("생성된 트리 : \(binaryHeap.items)")

while binaryHeap.count() > 0 {
    print(binaryHeap.pop())
}

