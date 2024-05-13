import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var answer = 0
    var visited: [Bool] = Array(repeating: false, count: n)
    for start in 0..<n {
        var queue: [Int] = [start]
        guard !visited[start] else { continue }
        answer += 1
        visited[start] = true
        var index = 0
        while queue.count > index {
            let current = queue[index]
            for next in 0..<computers[current].count where !visited[next] {
                if computers[current][next] == 1 {
                    visited[next] = true
                    queue.append(next)
                }
            }
            index += 1
        }
    }
    return answer
}