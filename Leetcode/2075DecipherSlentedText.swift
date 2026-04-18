// 2075 Decipher slantd text ~ medium
import Foundation

class Solution {
    func decodeCiphertext(_ encodedText: String, _ rows: Int) -> String {
        let numOfChars = rows-1
        var stringArray = encodedText.components(separatedBy: "   ")
        print(stringArray)
        var added = true
        var finalText = ""
        while added{
            added = false

            for i in 0..<stringArray.count{
                if stringArray[i].count==0{
                    continue
                }
                finalText += String(stringArray[i].first!)
                stringArray[i].remove(at: stringArray[i].startIndex)
                added = true
            }
        } 
        return finalText
    }
}

print(Solution().decodeCiphertext(" b  ac", 2))
print(Solution().decodeCiphertext("iveo    eed   l te   olc", 2))
print(Solution().decodeCiphertext("ch   ie   pr", 2))