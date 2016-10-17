import Foundation

struct Bob {
    
    enum Response: String {
        
        case Sure = "Sure."
        case Chill = "Woah, chill out!"
        case Fine = "Fine, be that way."
        case Whatever = "Whatever."
    }
    
    static func hey(input: String) -> String {
        switch input {
            case _ where input.isYell:
                return Response.Chill.rawValue
            case _ where input.isQuestion:
                return Response.Sure.rawValue
            case _ where input.isBlank:
                return Response.Fine.rawValue
            default:
                return Response.Whatever.rawValue
        }
    }
}

extension String {
    var isQuestion: Bool {
        return characters.last == "?"
    }
    
    var isBlank: Bool {
        return trim.isEmpty
    }
    
    var isYell: Bool {
        return hasUppercaseLetters && !hasLowercaseLetters
    }
    
    var trim: String {
        return stringByTrimmingCharactersInSet(.whitespaceAndNewlineCharacterSet())
    }
    
    var hasUppercaseLetters: Bool {
        return rangeOfCharacterFromSet(.uppercaseLetterCharacterSet()) != nil
    }
    
    var hasLowercaseLetters: Bool {
        return rangeOfCharacterFromSet(.lowercaseLetterCharacterSet()) != nil
    }
}