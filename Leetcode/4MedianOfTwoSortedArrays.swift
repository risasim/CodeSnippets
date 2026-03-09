import Foundation
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
        var head1:Int = 0
        var head2:Int = 0

        while ((head1 != nums1.count) || (head2 != nums2.count)){
            if head1 == nums1.count{
                array.append(contentsOf: Array(nums2[head2..<nums2.count]))
                break
            }else if head2 == nums2.count{
                array.append(contentsOf: Array(nums1[head1..<nums1.count]))
                break
            }

            if nums1[head1]<nums2[head2]{
                array.append(nums1[head1])
                head1+=1
            }else{
                array.append(nums2[head2])
                head2+=1
            } 
        }
        let len:Int = array.count
        if (len%2==0){
            let middle = (len / Int(2))
            let vals:Double = Double((array[middle-1]+array[middle]))/2
            print("vals \(vals)")
            return vals
        }else{
            let middle = ceil(Double((Double(len) / Double(2))))
            print(middle)
            return Double(array[Int(middle-1)])
        }
    }
}


print(Solution().findMedianSortedArrays([2,2,4,4],[2,2,2,4,4]))
//print(Solution().findMedianSortedArrays([1,2],[3,4]))