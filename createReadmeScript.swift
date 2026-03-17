import Foundation


private let directory = "Leetcode"
func updateReadme(){
    // First create the file manager 
    let fileManager = FileManager.default
    let targetFolder = URL(string: fileManager.currentDirectoryPath)?.appendingPathComponent(directory, isDirectory: true)

    do{
        let itemsURLs = try fileManager.contentsOfDirectory(at: targetFolder!, includingPropertiesForKeys: [.isDirectoryKey], options: .skipsHiddenFiles)

        for fileURL in itemsURLs{
            if fileURL.pathExtension != ".swift"{ continue }

        }
    }catch{

    }
}

updateReadme()