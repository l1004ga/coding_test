import Foundation

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class ListNode {
    var val: Int
    var next: ListNode?
    init() { self.val = 0; self.next = nil; }
    init(_ val: Int) { self.val = val; self.next = nil; }
    init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

var a1 = ListNode(4)
var b1 = ListNode(2, a1)
var c1 = ListNode(1, b1)

var a2 = ListNode(4)
var b2 = ListNode(3, a2)
var c2 = ListNode(1, b2)

class Solution {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        var l1 = list1
        var l2 = list2
        var result : ListNode = ListNode()
        let head = result
        
        while l1 != nil || l2 != nil {
            if l1 == nil {
                result.next = l2
                break
            }
            if l2 == nil {
                result.next = ListNode(l1!.val)
                l1 = l1!.next
                result = result.next!
                continue
            }
            if l1!.val <= l2!.val {
                // 신규 노드에 해당 노드를 넣어줌
                result.next = ListNode(l1!.val)
                // 해당 노드 삭제
                l1 = l1!.next
                result = result.next!
            } else {
                result.next = ListNode(l2!.val)
                l2 = l2!.next
                result = result.next!
            }
        }
        
        print(result.val)
        return head.next
        
    }
}

//let solution = Solution()

//solution.mergeTwoLists(c1, c2)
