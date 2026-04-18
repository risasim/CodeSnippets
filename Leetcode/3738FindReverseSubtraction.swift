// 3738  Mirror Distance of an Integer ~ easy

class Solution {
    func mirrorDistance(_ n: Int) -> Int {
        let numString = String(n)
        let reverseString = String(numString.reversed())
        let reverseNum = Int(reverseString)!
        return abs(n - reverseNum) 
    }
}


print(Solution().mirrorDistance(25))