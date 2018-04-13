import Foundation

struct Acronym {
 
    static func abbreviate(_ string:String) -> String {
        let words = string.split(separator: " ").map(String.init)
        return words.reduce("") { $0 + $1.acronym }
    }
}

extension String {
    var acronym: String {
        var acronym = ""
        var addNext = true
        let isUppercase = (self == self.uppercased())
        for char in self {
            let upChar = String(char).uppercased()

            if (addNext) {
                addNext = false
                acronym += upChar
                continue
            }

            if (CharacterSet.punctuationCharacters.contains(UnicodeScalar(String(char).utf16[String(char).utf16.startIndex])!)) {
                addNext = true
                continue
            }

            if (String(char) == upChar && isUppercase == false) {
                acronym += upChar
                continue
            }
        }
        
        return acronym
    }
}
