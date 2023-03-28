/*
 최단경로 - 다익스트라
 
 항상 노드 주변의 최단 경로만을 택하는 대표적 그리디 알고리즘
 노드 주변 탐색 시 BFS를 이용하는 대표적 알고리즘
 
 오리지널 다익스트라와 다른 우선순위 큐를 이용한 방식으로 풀이함
 
 우선순위 큐(ADT) : 자유롭게 삽입, max/min 특정 기준에 따라서 우선수위를 정해서 꺼내줌
 해당 ADT를 구현한 구현체 = 힙 - 최대힙/최소힙
 
 -> 해당 문제는 가장 짧은 거리를 구하는 문제이기 때문에 최소힙(배열)을 사용한다.
 
 */

public struct Heap<T> {
    var nodes: [T] = []
    let comparer: (T,T) -> Bool
    
    var isEmpty: Bool {
        return nodes.isEmpty
    }
    
    init(comparer: @escaping (T,T) -> Bool) {
        self.comparer = comparer
    }
    
    func peek() -> T? {
        return nodes.first
    }
    
    mutating func insert(_ element: T) { // 힙(완전 이진 트리)에 맞게 1. 일단 값 삽입 2. 비교 후 스왑 - 최소힙....?
        var index = nodes.count
        
        nodes.append(element)
        
        while index > 0, !comparer(nodes[index],nodes[(index-1)/2]) {
            nodes.swapAt(index, (index-1)/2)
            index = (index-1)/2
        }
    }
    
    mutating func delete() -> T? { // 가장 작은 값 = root 값을 pop 해준다.
        guard !nodes.isEmpty else {
            return nil
        }
        
        if nodes.count == 1 {
            return nodes.removeFirst()
        }
        
        let result = nodes.first
        nodes.swapAt(0, nodes.count-1)
        _ = nodes.popLast()
        
        var index = 0
        
        while index < nodes.count {
            let left = index * 2 + 1
            let right = left + 1
            
            if right < nodes.count {
                if comparer(nodes[left], nodes[right]),
                   !comparer(nodes[right], nodes[index]) {
                    nodes.swapAt(right, index)
                    index = right
                } else if !comparer(nodes[left], nodes[index]){
                    nodes.swapAt(left, index)
                    index = left
                } else {
                    break
                }
            } else if left < nodes.count {
                if !comparer(nodes[left], nodes[index]) {
                    nodes.swapAt(left, index)
                    index = left
                } else {
                    break
                }
            } else {
                break
            }
        }
        
        return result
    }
}

extension Heap where T: Comparable {
    init() {
        self.init(comparer: >)
    }
}

struct EdgeData : Comparable{
    static func < (lhs: EdgeData, rhs: EdgeData) -> Bool {
        lhs.cost < rhs.cost
    }
    
    var cost : Int
    var node : Int  //노드가 ABC 일 경우 String 등 적절하게 바꿔줘야 함
}

class Solution {

typealias Cost = Int
typealias IntNode = Int



//사용예시 다익스트라-힙

func networkDelayTime(_ times: [[Int]], _ n: Int, _ k: Int) -> Int { // n은 총 노드 갯수, k는 시작 노드
    let inf = Int.max //
    
    var graph : [IntNode:[IntNode:Cost]] = [:] //출발지:도착지:소요시간
    for road_start_end_cost in times {
        let start = road_start_end_cost[0] //출발지
        let end = road_start_end_cost[1] //도착지
        let cost = road_start_end_cost[2] //소요시간
        
        if graph[start] == nil {
            graph[start] = [:]
        }
        // 방향이 지정되어 있음
        // 처음 graph[start]![end] 값을 넣어줄 때 특정값을 넣어줘야 하는데, cost와 비교 시 무조건 cost가 더 작아야 하기 때문에 inf(=Int.max)를 기본값으로 해주어야 한다.
        graph[start]![end] = min(graph[start]![end, default: inf], cost)
        
        /* 양방향인 경우에 아래 코드를 추가적으로 넣어줘야 함.
        if graph[end] == nil {
            graph[end] = [:]
        }
        // 방향이 지정되어 있음
        graph[end]![start] = min(graph[end]![start, default: inf], cost)
         */

    }
    
    
    let first = k //노드의 시작지점은 k
    var dist : [IntNode:Cost] = [first:0] //출발지:소요시간
    var prev : [IntNode:IntNode?] = [:] //출발지:도착지
    let vertexies = 1...n
    
    
    var pq: Heap = Heap<EdgeData>()
    
    for v in vertexies { // 1~n 까지의 노드 값
        // 1~n개의 노드 중 시작노드가 아닌 경우 아래 if문 실행
        if v != first {
            dist[v] = inf
            prev[v] = nil
        }
        
        pq.insert(EdgeData(cost: dist[v]!,node: v))
    }
    
    while(!pq.isEmpty){
        let u = pq.delete()! //우선순위 큐에서 하나 지우면서 꺼내온걸 u에 담아줌 (가장 cost가 작은 값을 꺼냄)
        for (node, cost) in graph[u.node]! {
            if dist[u.node]! == Int.max {
                return -1
            }
            let alt = dist[u.node]! + graph[u.node]![node]!
            //graph[u.node][node]
            if alt < dist[node]! {
                dist[node] = alt
                prev[node] = u.node
                pq.insert(EdgeData(cost: alt, node: node))
            }
            
        }
    }
    if dist.count == n {
        return dist.values.max()!
    }
    
    return 0
    
}
}
