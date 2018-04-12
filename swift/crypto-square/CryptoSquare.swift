import Foundation

struct Crypto {
    
    let plain: String
    let normalizePlaintext: String
    let size: Int
    let plaintextSegments: [String]
    
    var ciphertext: String {
        var cipher = ""
        
//        for index in 0..<size {
//            for segment in plaintextSegments {
//                let startIndex = segment.characters.index(segment.startIndex, offsetBy: index, limitedBy:segment.endIndex)
//                let endIndex = segment.characters.index(segment.startIndex, offsetBy: index+1, limitedBy:segment.endIndex)
//                let range = Range(uncheckedBounds: (lower: startIndex, upper: endIndex))
//                cipher += segment.substring(with: range)
//            }
//        }
        
        return cipher
    }
    
    var normalizeCiphertext: String {
        return ""
//        let text = ciphertext
//        let charCount = text.characters.count
//        let rows = Int(ceil(Double(charCount) / Double(size)))
//        return text.segments(rows).joined(separator: " ")
    }
    
    init(_ plain: String) {
        self.plain = plain.lowercased()
        self.normalizePlaintext = plain.normalize().lowercased()
        self.size = normalizePlaintext.squareSize()
        self.plaintextSegments = normalizePlaintext.segments(size)
    }
}

extension String {
    func normalize() -> String {
        let validCharacters = CharacterSet.letters.union(CharacterSet.decimalDigits)
        
        return String(self.characters.filter{ (c: Character) in
            String(c).rangeOfCharacter(from: validCharacters) != nil
        })
//            validCharacters.contains(UnicodeScalar(String(c).utf16.first!)) })
    }
    
    func squareSize() -> Int {
        return Int(ceil(sqrt(Double(self.characters.count))))
    }
    
    func segments(_ size: Int) -> [String] {
        var segments = [String]()
//        var index = self.startIndex
//        
//        while index < self.endIndex {
//            let endIndex = self.index(index, offsetBy: size, limitedBy: self.endIndex)
//            let range = index..<endIndex
//            segments.append(self.substring(with: range))
//            index = endIndex
//        }
        
        return segments
    }
}
