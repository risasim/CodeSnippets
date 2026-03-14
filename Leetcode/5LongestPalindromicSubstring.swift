// The Swift Programming Language
// https://docs.swift.org/swift-book

//Given a string s, return the longest palindromic substring in s.

class Solution {
    var longestPal = ""
    
    //Brute force
    func longestPalindrome(_ s: String) -> String {
        let strAsArray = s.map({String($0)})
        longestPal = strAsArray[0]

        // for every letter have two pointers to the start and end of palindrome and then add either until you no longer can due to size or if addition of both/left/right with according pointer, does not yield palindrome
        for i in 0..<strAsArray.count{
            var currentPalindrome = "\(strAsArray[i])"
            var leftPointer = i-1
            var rightPointer = i+1
            var stopLoop = false
            var sameChar = true

            while !stopLoop{
                if longestPal.count==s.count{
                    break
                }

                let leftCharacter = checkIndexes(strAsArray, leftPointer) ?? ""
                let rightCharacter = checkIndexes(strAsArray, rightPointer) ?? ""
                if leftCharacter=="" && ""==rightCharacter{
                    stopLoop = true
                    break 
                }

                if leftCharacter==rightCharacter{
                    if leftCharacter != strAsArray[i]{
                        sameChar = false
                    }
                    currentPalindrome = "\(strAsArray[leftPointer])"+currentPalindrome+"\(strAsArray[rightPointer])"
                    updatePalindrome(currentPalindrome)
                    rightPointer+=1
                    leftPointer-=1
                    continue
                }

                var change = false
                if leftCharacter != "" && sameChar{
                    if leftCharacter == strAsArray[i]{
                        currentPalindrome = leftCharacter+currentPalindrome
                        updatePalindrome(currentPalindrome)
                        leftPointer-=1
                        change = true   
                    }
                }

                if rightCharacter != "" && sameChar{
                    if rightCharacter == strAsArray[i]{
                        currentPalindrome = currentPalindrome+rightCharacter
                        updatePalindrome(currentPalindrome)
                        rightPointer+=1
                        change = true   
                    }
                }

                if !change{
                    stopLoop=true
                }
            }
        }
        return longestPal
    }

    func checkIndexes(_ arr:[String], _ index:Int) -> String?{
        if index<0 || index>=arr.count{
            return nil
        }else{
            return arr[index]
        }
    }

    func updatePalindrome(_ curr:String){
        if curr.count>longestPal.count{
            //print("updating \(curr) instead of \(longestPal)")
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

print(Solution().longestPalindrome("babad"))
print(Solution().longestPalindrome("aacabdkacaa"))

print(Solution().longestPalindrome("tattarrattat"))

 print(Solution().longestPalindrome("a"))
 print(Solution().longestPalindrome("aba"))
 print(Solution().longestPalindrome("abb"))

