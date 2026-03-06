class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        let stringifiedInt = String(x)
        let stringArr = Array(stringifiedInt)
        var head = 0
        var tail = (stringArr.count) - 1
        while(head <= tail){
            if stringArr[head] != stringArr[tail]{
                return false
            }
            head+=1
            tail-=1
        }
        return true
    }
}