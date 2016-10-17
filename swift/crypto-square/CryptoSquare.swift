import Foundation

struct Crypto {
    
    let plain: String
    let normalizePlaintext: String
    let size: Int
    let plaintextSegments: [String]
    
    var ciphertext: String {
        var cipher = ""
        
        for index in 0..<size {
            for segment in plaintextSegments {
                let startIndex = segment.startIndex.advancedBy(index, limit:segment.endIndex)
                let endIndex = segment.startIndex.advancedBy(index+1, limit:segment.endIndex)
                let range = startIndex..<endIndex
                cipher += segment.substringWithRange(range)
            }
        }
        
        return cipher
    }
    
    var normalizeCiphertext: String {
        let text = ciphertext
        let charCount = text.characters.count
        let rows = Int(ceil(Double(charCount) / Double(size)))
        return text.segments(rows).joinWithSeparator(" ")
    }
    
    init(_ plain: String) {
        self.plain = plain.lowercaseString
        self.normalizePlaintext = plain.normalize().lowercaseString
        self.size = normalizePlaintext.squareSize()
        self.plaintextSegments = normalizePlaintext.segments(size)
    }
}

extension String {
    func normalize() -> String {
        let validCharacters = NSMutableCharacterSet()
        validCharacters.formUnionWithCharacterSet(.letterCharacterSet())
        validCharacters.formUnionWithCharacterSet(.decimalDigitCharacterSet())
        
        return String(self.characters.filter{ (c: Character) in
            validCharacters.characterIsMember(String(c).utf16.first!) })
    }
    
    func squareSize() -> Int {
        return Int(ceil(sqrt(Double(self.characters.count))))
    }
    
    func segments(size: Int) -> [String] {
        var segments = [String]()
        var index = self.startIndex
        
        while index < self.endIndex {
            let endIndex = index.advancedBy(size, limit: self.endIndex)
            let range = index..<endIndex
            segments.append(self.substringWithRange(range))
            index = endIndex
        }
        
        return segments
    }
}
