//
//  heap.swift
//  practice01
//
//  Created by dev on 2023/02/11.
//

import Foundation

typealias Cost = Int
typealias IntNode = Int

//사용예시 다익스트라-힙
func solution(_ N:Int, _ road:[[Int]], _ k:Int) -> Int {
    let inf = Int.max

    var graph : [IntNode:[IntNode:Cost]] = [:]
    for road_start_end_cost in road {
        let start = road_start_end_cost[0]
        let end = road_start_end_cost[1]
        let cost = road_start_end_cost[2]
        if graph[start] == nil{
            graph[start] = [:]
        }
        if graph[end] == nil {
            graph[end] = [:]
        }
        graph[start]![end] = min(graph[start]![end, default: inf], cost)
        graph[end]![start] = min(graph[end]![start, default: inf], cost)
    }

    let first = 1
    var dist : [IntNode:Cost] = [first:0]
    var prev : [IntNode:IntNode?] = [:]
    let vertexies = 1...N
    
    
    var pq: Heap = Heap<EdgeData>()
    
    for v in vertexies {
        if v != first {
            dist[v] = inf
            prev[v] = nil
        }
        
        pq.insert(EdgeData(cost: dist[v]!,node: v))
    }
    
    while(!pq.isEmpty){
        let u = pq.delete()! //큐에서 하나 지우면서 꺼내온걸 u에 담아줌 (가장 cost가 작은 값을 꺼냄)
        
        for (node, cost) in graph[u.node]! {
            let alt = dist[u.node]! + graph[u.node]![node]! //graph[u.node][node]
            if alt < dist[node]! {
                dist[node] = alt
                prev[node] = u.node
                pq.insert(EdgeData(cost: alt, node: node))
            }
        
        }
    }
    print(dist.filter{ $0.value <= k }.count)
    return dist.filter{ $0.value <= k }.count
    
}

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

  mutating func insert(_ element: T) {
      var index = nodes.count

      nodes.append(element)

      while index > 0, !comparer(nodes[index],nodes[(index-1)/2]) {
          nodes.swapAt(index, (index-1)/2)
          index = (index-1)/2
      }
  }

  mutating func delete() -> T? {
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
