// 2078. Two Furthest Houses With Different Colors ~ easy

class Solution {
    func maxDistance(_ colors: [Int]) -> Int {
        var startIndex = -1
        var maxDiff = 0
        var lastColor = -1
        for i in 0..<colors.count{
            if colors[i] != lastColor && startIndex == -1{
                print("changed index with \(i)")
                startIndex = i
            }else if colors[i] == lastColor && startIndex != -1{
                print("comput vals at \(i)")
                var val = abs(startIndex-i)
                if startIndex != 0{
                    val+=1
                }
                if val>maxDiff{
                    maxDiff=val
                } 
                startIndex = -1
            }
            lastColor = colors[i]
        }
        if startIndex != -1{
            let val = abs(startIndex-(colors.count - 1))
            if val>maxDiff{
                maxDiff=val
            } 
        }
        return maxDiff
    }
}

//print(Solution().maxDistance([1,8,3,8,3]))
print(Solution().maxDistance([1,1,1,6,1,1,1]))
//print(Solution().maxDistance([0,1]))
print(Solution().maxDistance([2,8,8,11]))
