import Foundation

// 최대 힙
class BinaryHeap {
    
    private var items : [Int]
    
    init() {
        // 0번째 인덱스는 사용하지 않는 것으로 함 -> 트리의 배열 표현의 경우 계산상 인덱스는 1부터 시작
        self.items = [-1]
    }
    
    var count : Int {
        self.items.count - 1
    }
    
//    func count() -> Int {
//        // 0번재 인덱스는 사용하지 않기에 전체 크기에서 0번을 제외하기 위해서 -1을 해줌
//        return self.items.count - 1
//    }
    
    private func percolateUp() {
        var target : Int = self.count
        var parent : Int = target / 2  // 무조건 마지막에 들어온 값에서 2를 하면 해당하는 부모 노드를 찾을 수 있음
        
        while parent > 0 {
            if self.items[target] > self.items[parent] {
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
        
        while parent < (self.items.count - 1) / 2 {
            // 두 자식 모두 부모보다 작은 경우
            if self.items[parent] >= self.items[left] && self.items[parent] >= self.items[right]  {
                return
            }
            // 두 자식 모두 부모보다 큰 경우
            if self.items[parent] < self.items[left] && self.items[parent] < self.items[right] {
                // 더 작은 숫자의 자식과 교환
                if self.items[left] > self.items[right] {
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
            
            if self.items[parent] < self.items[left] || self.items[parent] < self.items[right] {
                if self.items[parent] < self.items[left] {
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
        
        if parent == (self.items.count - 1) / 2 {
            if self.items[parent] < self.items[left] {
                self.items.swapAt(parent, left)
                return
            }
        }
    }
}


class Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        
        let binaryHeap = BinaryHeap()
        var result : Int = 0
    
        
        // 최대 힙으로 정렬하기
        nums.forEach{binaryHeap.insert(inValue: $0)}
        (1...k).forEach{_ in result = binaryHeap.pop()}
        
        return result
    }
}

var solution = Solution()

//print(solution.findKthLargest([3,2,1,5,6,4],2))
print(solution.findKthLargest([3,2,3,1,2,4,5,5,6], 9))
