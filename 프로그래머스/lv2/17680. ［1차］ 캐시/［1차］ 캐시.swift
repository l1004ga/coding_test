import Foundation

struct Queue<T: Equatable> {
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

    mutating func contains(_ input: T) -> Bool {
            return inbox.contains(input) || outbox.contains(input)
    }

    mutating func remove(_ input: T) {
        var temBox : [T] = []
        while self.size > 0 {
            var value = dequeue()
            if value != input {
                temBox.append(value as! T)
//                print(value)
            }
        }
        
        for i in temBox {
            enqueue(i)
        }
//        print(self.size)
        
//        if self.dequeue() == input {
//            return
//        } else {
//            enqueue(dequeue()!)
//        }
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

func solution(_ cacheSize:Int, _ cities:[String]) -> Int {

    var cacheQueue = Queue<String>()
    var timeResult : Int = 0

    for i in cities {

        // 큐에 있으면 있는걸 사용
        if cacheQueue.contains(i.lowercased()) {
            timeResult += 1
            // 최근 사용한 값 최신화
            cacheQueue.remove(i.lowercased())
            cacheQueue.enqueue(i.lowercased())
            continue
        }
        
        // 큐에 없으면
        // 큐의 크기가 캐시 사이즈보다 작은 경우 새로 넣을 수 있음
        if cacheQueue.size < cacheSize {
            cacheQueue.enqueue(i.lowercased())
            timeResult += 5
            continue
        }
        
        // 캐시 사이즈가 0인 경우
        if cacheSize == 0 {
            timeResult += 5
            continue
        }
        
        // 큐의 크기가 캐시 사이즈와 같은 경우
        cacheQueue.dequeue()
        timeResult += 5
        cacheQueue.enqueue(i.lowercased())

    }

    return timeResult
}