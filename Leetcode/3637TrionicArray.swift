// 3637 Trionic array ~ medium

class Solution {
    func isTrionic(_ nums: [Int]) -> Bool {
        var inc1Ended = false

        var dec2Ended = false

        if nums.count<4{
            return false
        }
        var last = nums[1]
        var laster = nums[0]
        if laster>last{
            print("failed on primary")
            return false
        }
        for i in 2..<nums.count{
            if laster==last || last == nums[i]{
                print("failed on secondary \(laster) \(last)")
                return false
            }
            if !inc1Ended{
                if last>nums[i] && laster<last{
                    inc1Ended=true
                }
            }else{
                if !dec2Ended{
                    if last<nums[i]  && laster>last{
                        dec2Ended=true
                    }
                }else{
                    if last>nums[i] {
                        print("failed on \(last) and \(nums[i])")
                        return false
                    }
                }
            }
            laster = last
            last = nums[i]
        }
        print("firts \(inc1Ended) and sec \(dec2Ended)")
        return inc1Ended && dec2Ended
    }
}



//print(Solution().isTrionic([1,3,5,4,2,6]))
//print(Solution().isTrionic([2,1,3]))
print(Solution().isTrionic([1,3,5,4,2,6]))

