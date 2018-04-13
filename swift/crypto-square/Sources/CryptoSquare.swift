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
                let charIndex = segment.index(segment.startIndex, offsetBy: index, limitedBy: segment.endIndex) ?? segment.endIndex
                guard charIndex != segment.endIndex else { continue }
                cipher += String(segment[charIndex])
            }
        }
        
        return cipher
    }
    
    var normalizeCiphertext: String {
        let text = ciphertext
        let charCount = text.count
        let rows = Int(ceil(Double(charCount) / Double(size)))
        return text.segments(rows).joined(separator: " ")
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
        
        return String(self.filter{ (c: Character) in
            String(c).rangeOfCharacter(from: validCharacters) != nil
        })
    }
    
    func squareSize() -> Int {
        return Int(ceil(sqrt(Double(self.count))))
    }
    
    func segments(_ size: Int) -> [String] {
        var segments = [String]()
        var index = self.startIndex
        
        while index < self.endIndex {
            let endIndex = self.index(index, offsetBy: size, limitedBy: self.endIndex) ?? self.endIndex
            segments.append(String(self[index..<endIndex]))
            index = endIndex
        }
        
        return segments
    }
}
