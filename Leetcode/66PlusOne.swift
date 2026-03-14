class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        var digitsCopy = digits

        var shouldAdd = false
        for i in (0..<digits.count).reversed(){
            if digitsCopy[i]+1 < 10{
                digitsCopy[i] += 1
                shouldAdd = false
                break
            }
            else{
                shouldAdd=true
                digitsCopy[i] = 0
            }
        }
        if shouldAdd{
            digitsCopy = [1] + digitsCopy
        }
        return digitsCopy
    }
}

print(Solution().plusOne([8,9,9,9]))