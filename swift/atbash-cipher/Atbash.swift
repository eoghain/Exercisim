import Foundation

struct Atbash {
    
    static func encode(_ message: String) -> String {
        var index = 0
        var encodedMessage = ""
        
        for ch in message.lowercased().characters {
            if let encodedChar = bashCharacter(ch)
            {
                encodedMessage += encodedChar
                index += 1
                if (index % 5 == 0) {
                    encodedMessage += " "
                }
            }
        }
        
        return encodedMessage.trimmingCharacters(in: CharacterSet.whitespaces)
    }
    
    static func bashCharacter(_ character: Character) -> String? {
        let key = Array("abcdefghijklmnopqrstuvwxyz".characters)
        if let charIndex = key.index(of: character) {
            return String(key[25 - charIndex])
        }
        
        if (String(character).trimmingCharacters(in: CharacterSet.decimalDigits).isEmpty) {
            return String(character)
        }
        
        return nil
    }
}
