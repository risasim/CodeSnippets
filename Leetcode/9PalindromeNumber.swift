// 9. Palindrome number ~ easy

//Given an integer x, return true if x is a palindrome, and false otherwise.

class Solution {
    static func isPalindrome(_ x: Int) -> Bool {
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

print(Solution.isPalindrome(0))
print(Solution.isPalindrome(123))
print(Solution.isPalindrome(1554551))
print(Solution.isPalindrome(1331))