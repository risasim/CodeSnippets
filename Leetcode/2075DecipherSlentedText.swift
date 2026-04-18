// 2075 Decipher slantd text ~ medium
import Foundation

class Solution {
    func originalDecodeCiphertext(_ encodedText: String, _ rows: Int) -> String {
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

    func decodeCiphertext(_ encodedText: String, _ rows: Int) -> String {
        if encodedText == ""{
            return ""
        }
        let numOfTheOtherRows = (encodedText.count/rows)
        var stringArray = encodedText.components(withMaxLength: numOfTheOtherRows)
        print(stringArray)
        var longest = 0
        for str in stringArray{
            let trimCount = str.trimmingCharacters(in: .whitespaces).count
            if trimCount>longest{
                longest = trimCount
            }
        }
        var added = true
        var finalText = ""
        for j in 0..<longest{
            for i in 0..<rows{
                if i+j>=stringArray[0].count{
                    break
                }
                finalText += stringArray[i][i+j]
            }
        }
        return finalText.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression)
    }
}

extension String {
    func components(withMaxLength length: Int) -> [String] {
        return stride(from: 0, to: self.count, by: length).map {
            let start = self.index(self.startIndex, offsetBy: $0)
            let end = self.index(start, offsetBy: length, limitedBy: self.endIndex) ?? self.endIndex
            return String(self[start..<end])
        }
    }
}

extension String {
    subscript(i: Int) -> String {
        return String(self[index(startIndex, offsetBy: i)])
    }
}

print(Solution().decodeCiphertext("             a     b", 4))
//print(Solution().decodeCiphertext("iveo    eed   l t    olc", 4))
//print(Solution().decodeCiphertext("ch   ie   pr", 3))