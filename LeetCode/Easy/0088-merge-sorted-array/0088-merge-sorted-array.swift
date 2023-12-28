class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        
        if m == 0 {
            nums1 = nums2
        } else {
            nums1 = (nums1[0...m-1] + nums2).sorted()
        }
    }
}