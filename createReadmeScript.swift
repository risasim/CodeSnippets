import Foundation


private let directory = "Leetcode"
private let README = "README.md"
private let regex = try NSRegularExpression(
    pattern: #"//\s*([^~]+?)~\s*(easy|medium|hard)"#,
    options: .caseInsensitive
)
func updateReadme(){
    // First create the file manager 
    let fileManager = FileManager.default
    let targetFolder = URL(fileURLWithPath: fileManager.currentDirectoryPath).appendingPathComponent(directory, isDirectory: true)
    print("Scanning: \(targetFolder.path)")

    let toBeWritten:[(name:String, level:String)] = getData(fileManager, targetFolder)


    let rows = toBeWritten.map { "| \($0.name) | \($0.level)" }
    let table = """
    | Name | Difficulty |
    |------|------------|
    \(rows.joined(separator: "\n"))
    """

    let readmeURL = URL(fileURLWithPath: fileManager.currentDirectoryPath).appendingPathComponent(README)
    var readmeContent = (try? String(contentsOf: readmeURL, encoding: .utf8)) ?? "# Solutions\n"

    let sectionMarker = "## Leetcode"
    let startMarker   = "<!-- LEETCODE:START -->"
    let endMarker     = "<!-- LEETCODE:END -->"

    let generatedBlock = """
    \(startMarker)
    \(table)
    \(endMarker)
    """

    if let startRange = readmeContent.range(of: startMarker), let endRange = readmeContent.range(of: endMarker){
        let fullRange = startRange.lowerBound..<endRange.upperBound
        readmeContent.replaceSubrange(fullRange, with: generatedBlock)
    }else if let sectionRange = readmeContent.range(of: sectionMarker){
        let insertPoint = sectionRange.upperBound < readmeContent.endIndex
    ? readmeContent.index(after: sectionRange.upperBound)
    : readmeContent.endIndex
        readmeContent.insert(contentsOf: "\n"+generatedBlock+"\n", at: insertPoint)
    }else{
        readmeContent += "\n\(sectionMarker)\n\(generatedBlock)\n"
    }

    do {
        try readmeContent.write(to: readmeURL, atomically: true, encoding: .utf8)
        print("\nREADME updated with \(toBeWritten.count) exercises.")
    } catch {
        print("Error writing README: \(error)")
    }

}


private func getData(_ fileManager:FileManager, _ targetFolder:URL)->[(name:String, level:String)]{
    var toBeWritten:[(name:String, level:String)] = []
    do{
        let itemsURLs = try fileManager.contentsOfDirectory(at: targetFolder, includingPropertiesForKeys: [.isDirectoryKey], options: .skipsHiddenFiles)

        for fileURL in itemsURLs{
            guard fileURL.pathExtension == "swift" else{ continue }
            
            let text2 = try String(contentsOf: fileURL, encoding: .utf8)
            let lines = text2.split(separator: "\n")
            guard lines.count>0 else {continue}

            let range =  NSRange(lines[0].startIndex..., in: lines[0])
            guard let match = regex.firstMatch(in: String(lines[0]), range: range) else { 
                print("We have a naughty file \(fileURL.absoluteString)")
                continue 
            }
            guard  
                let nameRange = Range(match.range(at: 1), in: lines[0]),
                let levelRange = Range(match.range(at: 2), in: lines[0]) else {continue}
            
            let name = lines[0][nameRange].trimmingCharacters(in: .whitespaces)
            let level = lines[0][levelRange].capitalized

            toBeWritten.append((name, level))

        }
    }catch{
        print(error)
        print("error while opening directory")
    }
    return toBeWritten
}

updateReadme()