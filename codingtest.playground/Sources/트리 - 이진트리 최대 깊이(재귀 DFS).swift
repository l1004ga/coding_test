/*
 
 트리 : 순환구조를 갖지 않는 그래프
 트리(ADT) - root로 시작해서 간선을 통해서 자식노드로 연결됨 + ** 트리는 모든 노드의 부모노드가 무조건 1개여야 함
 
 자식 노드의 갯수 = 차수(degree)
 루트노드 + 자식노드의 갯수 = 크기(size)
 현재 위치부터 리프(leaf)까지의 거리 = 높이(height)
 루트노드부터 현재 노드까지의 거리 = 깊이(depth)
 레벨은 루트노드 = 0 부터 시작한다.
 c
 이진트리 : 자식 노드의 차수가 2인 경우가 아닌, 2 이하인 경우를 말한다.
 - 정이진트리 : 모든 노드가 0 or 2개의 자식노드를 가짐
 - 완전이진트리 : 마지막 레벨을 제외한 모든 노드가 채워져 있으며, 마지막 노드는 왼쪽부터 채워져있다.
 - 포화이진트리 : 모든 노드가 2개의 자식노드를 가지고, 모든 리프노드가 동등한 깊이를 가진다.
 */
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
import Foundation

// 이중스택큐
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

class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

// 재귀 - 트리 크기에 따라서 구현이 어려울 수 있음(스택 오버플로우 발생) -> 이런 경우 스택을 사용해서 풀어야 함
// 이유 : 일반 재귀를 쓰면 스택 크기를 시스템이 관리해주는데, 이걸 벗어날 경우 직접 스택을 지정해서 관리 필요
class Solution {
    func maxDepth(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        
        return max(maxDepth(root!.left), maxDepth(root!.right)) + 1
        // 위 코드는 아래 코드를 개선한 최종 코드
        /*
        var tree : TreeNode = root!
        var maxCount : Int = 0
        
        if tree.left != nil {
            maxCount = max(maxDepth(tree.left), maxCount)
        }
        if tree.right != nil {
            maxCount = max(maxDepth(tree.right), maxCount)
        }
        
        return maxCount + 1
         */
    }
}

var solution = Solution()

// Example 1
solution.maxDepth(TreeNode(3, TreeNode(9), TreeNode(20, TreeNode(15), TreeNode(7))))

dump(solution.maxDepth(TreeNode(3, TreeNode(9), TreeNode(20, TreeNode(15), TreeNode(7)))))

