// Given two sorted arrays nums1 and nums2 of size m and n respectively, return the median of the two sorted arrays.

// The overall run time complexity should be O(log (m+n)).


class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        // let middle = (nums1.count+nums2.count).round(.up)
        // if (middle%2)==0
        // let m = nums1.count
        // let n = nums2.count
        // for i in 0..<middle

        var array:[Int] = []
        var maxIndex = max(nums1.count,nums2.count)
        for i in 0..<(maxIndex){
            if i == nums1.count{
                array.append(contentsOf: Array(nums2[i..<maxIndex]))
                break
            }else if i == nums2.count{
                array.append(contentsOf: Array(nums1[i..<maxIndex]))
                break
            }

            if nums1[i]>nums2[i]{
                array.append(nums1[i])
            }else{
                array.append(nums2[i])
            }
        }
        print(array)
        return 4
    }
}


print(Solution().findMedianSortedArrays([1,3],[2]))
//print(Solution().findMedianSortedArrays([1,2],[3,4]))