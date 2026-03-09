class Solution {
    func minimumAbsDifference(_ arr: [Int]) -> [[Int]] {
        var lowest:Int? = nil 
        var occurLow:Int = 0
        
        for i in 1..<arr.count{
            for j in i..<arr.count{
                if lowest==nil{
                    lowest = [i]-[i-1]
                    occurLow = 1
                }
                var diff = [i]-[i-1]
                if diff<lowest!{
                    lowest = [i]-[i-1]
                    occurLow = 1
                }else if diff==lowest{
                     occurLow += 1
                }
            }
        }

    }
}