import Foundation


class Solution {
    func bitwiseComplement(_ n: Int) -> Int {
        var binaryStr = Array(Solution.intToBinary(n))

        for i in 0..<binaryStr.count{
            if binaryStr[i]=="0"{
                binaryStr[i]="1"
            }else{
                binaryStr[i]="0"
            }
        }
        return Solution.binaryToInt(String(binaryStr))

    }

    static func intToBinary(_ n:Int)-> String{
        if n == 0{
            return "0"
        }
        var remainder = n%2
        var rest = Int(n/2)
        var str = ""
        repeat{
            if remainder==1{
                str = "1"+str
            }else{
                str="0"+str
            }
            remainder = rest%2
            rest = Int(rest/2)
        }while rest != 0 || remainder != 0
        return str
    }

    static func binaryToInt(_ s: String) -> Int {
        let chars = Array(s)  
        var n = 0
        for i in (0..<chars.count).reversed() {
            let bit = Int(String(chars[i])) ?? 0 
            let place = chars.count - 1 - i 
            n += bit * Int(pow(2.0, Double(place))) 
        }
        return n  
    }
}


print(Solution.binaryToInt("101"))

print(Solution.intToBinary(3))





