import Foundation

struct WordCount {
    
    var phrase: String?
    
    init(words: String) {
        phrase = words.lowercaseString;
    }
    
    func count() -> [String:Int] {
        var countDict = [String:Int]()
        
        guard let words = self.phrase else {
            return countDict
        }
        
        words.enumerateSubstringsInRange(words.characters.indices, options: .ByWords) {
            (substring, _, _, _) -> () in
            
            if let substring = substring {
                if let wordCount = countDict[substring] {
                    countDict[substring] = wordCount + 1
                } else {
                    countDict[substring] = 1
                }
            }
        }
        
        return countDict
    }
}