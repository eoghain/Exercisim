import Foundation

struct Atbash {
    
    static func encode(message: String) -> String {
        var index = 0
        var encodedMessage = ""
        
        for ch in message.lowercaseString.characters {
            if let encodedChar = bashCharacter(ch)
            {
                encodedMessage += encodedChar
                index += 1
                if (index % 5 == 0) {
                    encodedMessage += " "
                }
            }
        }
        
        return encodedMessage.stringByTrimmingCharactersInSet(.whitespaceCharacterSet())
    }
    
    static func bashCharacter(character: Character) -> String? {
        let key = Array("abcdefghijklmnopqrstuvwxyz".characters)
        if let charIndex = key.indexOf(character) {
            return String(key[25 - charIndex])
        }
        
        if (String(character).stringByTrimmingCharactersInSet(.decimalDigitCharacterSet()).isEmpty) {
            return String(character)
        }
        
        return nil
    }
}