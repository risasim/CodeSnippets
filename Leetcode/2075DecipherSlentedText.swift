// 2075 Decipher slantd text ~ medium
import Foundation

class Solution {
    func decodeCiphertext(_ encodedText: String, _ rows: Int) -> String {
        if encodedText == ""{
            return ""
        }
        if rows == 1{
            return encodedText
        }
        let numOfTheOtherRows = (encodedText.count/rows)
        var stringArray = encodedText.components(withMaxLength: numOfTheOtherRows)
        var added = true
        var finalText = ""
        for j in 0..<numOfTheOtherRows{
            for i in 0..<rows{
                if i+j>=stringArray[0].count{
                    return finalText.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression)
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