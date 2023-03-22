import Foundation

// 큐(선입선출)를 이용한 스택 구현

struct Queue<T> {
    private var inbox: [T] = []
    private var outbox: [T] = []
    var size : Int = 0
    
    var isEmpty: Bool {
        return inbox.isEmpty && outbox.isEmpty
    }
    
    mutating func enqueue(_ input: T) {
        inbox.append(input)
        size += 1
    }
    
    @discardableResult
    mutating func dequeue() -> T? {
        if outbox.isEmpty {
            outbox = inbox.reversed()
            inbox.removeAll()
        }
        
        size -= 1
        
        return outbox.popLast()
    }
}



class MyStack {
    
    
    var queue : Queue<Int>
    
    init() {
        queue = Queue<Int>()
    }
    
    func push(_ x: Int) {
        queue.enqueue(x)
    }
    
    func pop() -> Int {
        if queue.size == 1 {
            return queue.dequeue()!
        }
        for _ in 0...queue.size - 2 {
            queue.enqueue(queue.dequeue()!)
        }
        return queue.dequeue()!
        
    }
    
    func top() -> Int {
        var result : Int = 0
        for _ in 0...queue.size - 1 {
            result = queue.dequeue()!
            queue.enqueue(result)
        }
        return result
    }
    
    func empty() -> Bool {
        return queue.isEmpty
    }
}

/**
 * Your MyStack object will be instantiated and called as such:
 * let obj = MyStack()
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Bool = obj.empty()
 */
