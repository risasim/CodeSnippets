// Given an integer array nums sorted in non-decreasing order, remove some duplicates in-place such that each unique element appears at most twice. The relative order of the elements should be kept the same.

// Since it is impossible to change the length of the array in some languages, you must instead have the result be placed in the first part of the array nums. More formally, if there are k elements after removing the duplicates, then the first k elements of nums should hold the final result. It does not matter what you leave beyond the first k elements.

// Return k after placing the final result in the first k slots of nums.

// Do not allocate extra space for another array. You must do this by modifying the input array in-place with O(1) extra memory.


class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var lastUniqueElement = 0
        var i = 1
        var occurenceCounter = 1
        while i<nums.count{
            if nums[lastUniqueElement] != nums[i]{
                lastUniqueElement+=1
                nums[lastUniqueElement] = nums[i]
                occurenceCounter = 1
            }else{
                if occurenceCounter < 2{
                    occurenceCounter+=1
                    lastUniqueElement+=1
                     nums[lastUniqueElement] = nums[i]
                    print("occurences increased \(occurenceCounter)")
                }
                print("occurences \(occurenceCounter)")
            }
            i+=1
        }
        return lastUniqueElement+1
    }
}

var nums = [0,0,1,1,1,1,2,3,3]; // Input array
let expectedNums = [0,0,1,1,2,3,3,69, 69]; // The expected answer with correct length

let k = Solution().removeDuplicates(&nums); // Calls your implementation

print(nums)

if  k != 7{
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