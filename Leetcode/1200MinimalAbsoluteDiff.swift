class Solution {
     func minimumAbsDifference(_ arr: [Int]) -> [[Int]] {
        var lowest:Int? = nil 
        var occurLow:[[Int]] = []
        let newArr = arr.sorted()
        
        for i in 0..<arr.count-1{
            var diff = newArr[i+1]-newArr[i]
            if lowest==nil || diff<lowest!{
                lowest = diff
                occurLow = [[newArr[i],newArr[i+1]]]
            }else if diff==lowest{
                occurLow.append([newArr[i],newArr[i+1]])
            }
        }
        return occurLow
    }




    func minimumAbsDifferenceNaive(_ arr: [Int]) -> [[Int]] {
        var lowest:Int? = nil 
        var occurLow:[[Int]] = []
        
        for i in 0..<arr.count{
            for j in i..<arr.count{
                if i==j{
                    continue
                }
                var diff = max(arr[i],arr[j])-min(arr[j],arr[i])
                if lowest==nil || diff<lowest!{
                    lowest = diff
                    occurLow = [[min(arr[i],arr[j]),max(arr[i],arr[j])]]
                }else if diff==lowest{
                     occurLow.append([min(arr[i],arr[j]),max(arr[i],arr[j])])
                }
            }
        }
        return occurLow.sorted{$0[0] < $1[0]}
    }
}