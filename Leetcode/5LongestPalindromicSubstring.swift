//Given a string s, return the longest palindromic substring in s.

class Solution {
    func longestPalindrome(_ s: String) -> String {
        let strAsArray = s.map({String($0)})
        var longestPal = strAsArray[0]

        if strAsArray.count<3{
            var head = 0
            var tail = strAsArray.count-1
            while head<=tail{
                if strAsArray[head] != strAsArray[tail]{return longestPal}
                head+=1
                tail-=1
            }
            return s
        }

        for i in 0..<s.count{
            var currentPalindrome = "\(strAsArray[i])"
            for j in 1..<s.count{
                if (i-j)<0 || (i+j)>=s.count{
                    break
                }
                if strAsArray[i-j] != strAsArray[i+j]{
                    if let char = checkSameChars(currentPalindrome){
                        print("checked palindrome \(char) and \(strAsArray[i-j]) \(strAsArray[i+j])")
                        if strAsArray[i-j]==char{
                            currentPalindrome = "\(strAsArray[i-j])"+currentPalindrome
                            if currentPalindrome.count>longestPal.count{
                                longestPal=currentPalindrome
                            }
                            print("append")
                        }else if strAsArray[i+j]==char{
                            currentPalindrome = currentPalindrome+"\(strAsArray[i+j])"
                            if currentPalindrome.count>longestPal.count{
                                longestPal=currentPalindrome
                            }
                            print("prepend")
                        }else{
                            break
                        }
                    }else{
                        break
                    }
                }else{
                    currentPalindrome = "\(strAsArray[i-j])"+currentPalindrome+"\(strAsArray[i+j])"
                    if currentPalindrome.count>longestPal.count{
                        longestPal=currentPalindrome
                    }
                }
            }
        }
        return longestPal
    }

    func checkSameChars(_ s:String)->String?{
        let strAsArray = s.map({String($0)})
        let base = strAsArray[0]
        for char in strAsArray{
            if char != base{
                return nil
            }
        }
        return base
    }
}

//print(Solution().longestPalindrome("babad"))
print(Solution().longestPalindrome("aaaa"))
// print(Solution().longestPalindrome("a"))
// print(Solution().longestPalindrome("aba"))
// print(Solution().longestPalindrome("abb"))
