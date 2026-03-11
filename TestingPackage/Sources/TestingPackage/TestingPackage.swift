// The Swift Programming Language
// https://docs.swift.org/swift-book

//Given a string s, return the longest palindromic substring in s.

class Solution {
    var longestPal = ""

    func longestPalindrome(_ s: String) -> String {
        let strAsArray = s.map({String($0)})
        longestPal = strAsArray[0]

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
            var leftBlocked = false
            var rightBlocked = false
            for j in 1..<s.count{
                // If one of the indexes is not valid -> does not work on even palindromes
                if 0>(i-j) || (i+j)>=s.count{
                    var added = false
                    if let char = checkSameChars(currentPalindrome){
                        if (i-j)>0 && !leftBlocked{
                            if strAsArray[i-j]==char{
                                print("added edgy left \(char) to \(currentPalindrome)")
                                currentPalindrome = "\(strAsArray[i-j])"+currentPalindrome
                                updatePalindrome(currentPalindrome)
                                added = true
                            }else{
                                leftBlocked = true
                            }
                        }
                        if (i+j)<s.count && !rightBlocked{
                            if strAsArray[i+j]==char{
                                print("added edgy right \(char) to \(currentPalindrome)")
                                currentPalindrome = currentPalindrome+"\(strAsArray[i+j])"
                                updatePalindrome(currentPalindrome)
                                added = true
                            }else{
                                rightBlocked = true
                            }
                        }
                    }
                    // TODO: Issue is here cause it can happen taht you have aaaa, so there is no middle point, the option to still append when on is still valid, technically needed only once
                    if ((i-j)<0 && (i+j)>=s.count) || !added{
                        break
                    }
                    print(currentPalindrome)
                    continue
                }

                // idea to create teh indexes like let charPre:STRING if out of the indexes you just put ""

                //IF asymetrical addition
                if strAsArray[i-j] != strAsArray[i+j]{
                    if let char = checkSameChars(currentPalindrome){
                        print("checked palindrome \(currentPalindrome) and \(strAsArray[i-j]) \(strAsArray[i+j])")
                        if strAsArray[i+j] != char && strAsArray[i-j] != char{
                            break
                        }
                        if strAsArray[i-j]==char && !leftBlocked{
                            currentPalindrome = "\(strAsArray[i-j])"+currentPalindrome
                            updatePalindrome(currentPalindrome)
                            print("append \(char) to \(currentPalindrome)")
                        }else{
                            leftBlocked = true
                        }
                        
                        if strAsArray[i+j]==char && !rightBlocked{
                            currentPalindrome = currentPalindrome+"\(strAsArray[i+j])"
                            updatePalindrome(currentPalindrome)
                            print("prepend \(char) to \(currentPalindrome)")
                        }else{
                           rightBlocked = true
                        }
                    }else{
                        break
                    }
                // IF the pre and after are the same just append both
                }else{
                    currentPalindrome = "\(strAsArray[i-j])"+currentPalindrome+"\(strAsArray[i+j])"
                    print(currentPalindrome)
                    updatePalindrome(currentPalindrome)
                }

                //Check if the palindrome is not the whole word
                if longestPal.count==strAsArray.count{
                    break
                }
            }
        }
        return longestPal
    }

    func updatePalindrome(_ curr:String){
        if curr.count>longestPal.count{
            print("updating \(curr) instead of \(longestPal)")
            longestPal=curr
        }
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
//print(Solution().longestPalindrome("aacabdkacaa"))

print(Solution().longestPalindrome("tattarrattat"))

// print(Solution().longestPalindrome("a"))
// print(Solution().longestPalindrome("aba"))
// print(Solution().longestPalindrome("abb"))

