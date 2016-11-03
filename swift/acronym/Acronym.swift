import Foundation

struct Acronym {
 
    static func abbreviate(string:String) -> String {
        let words = string.characters.split(" ").map(String.init)
        return words.reduce("") { $0 + $1.acronym }
    }
}

extension String {
    var acronym: String {
        var acronym = ""
        var addNext = true
        let isUppercase = (self == self.uppercaseString)
        for char in self.characters {
            let upChar = String(char).uppercaseString

            if (addNext) {
                addNext = false
                acronym += upChar
                continue
            }

            if (NSCharacterSet.punctuationCharacterSet().characterIsMember(String(char).utf16[String(char).utf16.startIndex])) {
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
