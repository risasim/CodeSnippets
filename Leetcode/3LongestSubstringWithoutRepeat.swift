// Given a string s, find the length of the longest substring without duplicate characters.

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var currentSubstringSet:Set = Set<String>()
        var longest = 0
        let array = s.map( { String($0) })
        var i = 0

        while i < array.count{
            if currentSubstringSet.contains(array[i]){
                longest = currentSubstringSet.count>longest ? currentSubstringSet.count : longest
                i = i - currentSubstringSet.count
                currentSubstringSet = Set<String>()

            }else{
                currentSubstringSet.insert(array[i])
            }
            i+=1
        }
        return currentSubstringSet.count>longest ? currentSubstringSet.count : longest
    }
}


var sol = Solution()
print(sol.lengthOfLongestSubstring("abcabcbb"))

print(sol.lengthOfLongestSubstring("bbbbb"))

print(sol.lengthOfLongestSubstring("pwwkew"))

print(sol.lengthOfLongestSubstring(" "))

print(sol.lengthOfLongestSubstring("babc"))


print(sol.lengthOfLongestSubstring("dvdf"))
