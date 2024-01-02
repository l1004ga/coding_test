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
// class Solution {
//     func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
//         guard let tree1 = p else { return p == nil }
//         guard let tree2 = q else { return q == nil }
        
//         if tree1.val != tree2.val {
//             return false
//         }
        
//         return isSameTree(tree1.left, tree2.left) && isSameTree(tree1.right, tree2.right)
//     }
    
// }

class Solution {
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        guard let p = p else {
            return q == nil
        }
        guard let q = q else {
            return p == nil
        }
  
        if p.val != q.val {
            return false
        }
  
        return isSameTree(p.left, q.left) && isSameTree(p.right, q.right)
    }
}

