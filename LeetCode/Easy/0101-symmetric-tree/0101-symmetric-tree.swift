class Solution {
    func isSymmetric(_ root: TreeNode?) -> Bool {
        
        let leftTree : [TreeNode?] = [root?.left]
        let rightTree : [TreeNode?] = [root?.right]
        
        // TreeNode 원소가 1개인 경우
        if root?.left == nil && root?.right == nil {
            return true
        }
        
        if root?.left == nil || root?.right == nil {
            return false
        }
        
        if root?.left!.val != root?.right!.val {
            return false
        }
        
        return checkSymmetric(leftTree, rightTree)
    }
    
    func checkSymmetric(_ leftTree: [TreeNode?],_ rightTree: [TreeNode?]) -> Bool {

        var leftval : [Int] = []
        var rightval : [Int] = []
        var nextLeftTree : [TreeNode?] = []
        var nextRightTree : [TreeNode?] = []
        
        for t in leftTree {
            if let left = t?.left {
                leftval.append(left.val)
                nextLeftTree.append(left)
            } else {
                leftval.append(101)
            }
            
            if let right = t?.right {
                leftval.append(right.val)
                nextLeftTree.append(right)
            } else {
                leftval.append(101)
            }
            
        }
        
        for t in rightTree {
            if let left = t?.left {
                rightval.append(left.val)
                nextRightTree.append(left)
            } else {
                rightval.append(101)
            }
            
            if let right = t?.right {
                rightval.append(right.val)
                nextRightTree.append(right)
            } else {
                rightval.append(101)
            }
        }
        
        if leftval != Array(rightval.reversed()) {
            return false
        }
        
        if leftval.isEmpty && rightval.isEmpty {
            return true
        }
        
        return checkSymmetric(nextLeftTree, nextRightTree)
 
    }
}