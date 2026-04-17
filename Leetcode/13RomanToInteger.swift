// 13. Roman integer ~ mediums

import Foundation

class Solution {
    func romanToInt(_ s: String) -> Int {
        let brokeDownString = s.map{String($0)}
        var finalNumber = 0
        var i = 0
        while i<brokeDownString.count{
            if i+1<brokeDownString.count && doICare(brokeDownString[i], after:brokeDownString[i+1]){
                finalNumber+=hasHigher(brokeDownString[i], after:brokeDownString[i+1])
                i+=2
                continue
            }
            finalNumber += getBasicNum(brokeDownString[i])
            i+=1
        }
        return finalNumber
    }

    func doICare(_ s:String, after:String)->Bool{
        switch s{
            case "I":
                if after=="X" || after == "V"{
                    return true
                }
                return false
            case "X":
               if after=="L" || after == "C"{
                    return true
                }
                return false
            case "C":
                if after=="D" || after == "M"{
                    return true
                }
                return false
            default:
                return false
        }
    }

    func hasHigher(_ s:String, after:String) -> Int{
        switch s{
            case "I":
                if after=="X"{
                    return 9
                }else if after == "V"{
                    return 4
                }
            case "X":
                if after=="L"{
                    return 40
                }else if after == "C"{
                    return 90
                }
            case "C":
                if after=="D"{
                    return 400
                }else if after == "M"{
                    return 900
                }
            default:
                return -3000
        }
        return -3000
    }

    func getBasicNum(_ s:String)->Int{
        switch s{
            case "I":
                return 1
            case "V":
                return 5
            case "X":
                return 10
            case "L":
                return 50
            case "C":
                return 100
            case "D":
                return 500
            case "M":
                return 1000
            default:
                return -3000
        }
    }

}

print(Solution().romanToInt("MCMXCIV"))