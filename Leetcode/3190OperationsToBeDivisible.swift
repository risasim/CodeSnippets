// You are given an integer array nums. In one operation, you can add or subtract 1 from any element of nums.

// Return the minimum number of operations to make all elements of nums divisible by 3.

class Solution {
    func minimumOperations(_ nums: [Int]) -> Int {
        var operations = 0
        for i in nums{
            if i%3 != 0{
                operations+=1
            }
        }
        return operations
    }
}