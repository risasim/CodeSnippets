// 26. Remove from sorted array ~ easy

// Given an integer array nums sorted in non-decreasing order, remove the duplicates in-place such that each unique element appears only once. The relative order of the elements should be kept the same.

// Consider the number of unique elements in nums to be k​​​​​​​​​​​​​​. After removing duplicates, return the number of unique elements k.

// The first k elements of nums should contain the unique numbers in sorted order. The remaining elements beyond index k - 1 can be ignored.

class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var lastUniqueElement = 0
        var i = 1
        while i<nums.count{
            if nums[lastUniqueElement] != nums[i]{
                lastUniqueElement+=1
                nums[lastUniqueElement] = nums[i]
            }
            i+=1
        }
        return lastUniqueElement+1
    }
}

var nums = [1,1,2]; // Input array
let expectedNums = [1,2,4]; // The expected answer with correct length

let k = Solution().removeDuplicates(&nums); // Calls your implementation

if  k != 2{
    print("fuck you \(k)")
}
var fuckedUp = false
for i in 0..<k {
    if nums[i] != expectedNums[i]{
        fuckedUp = true
    }
}
if fuckedUp{
    print("Fucked up")
}else{
     print("Not Fucked up")
}