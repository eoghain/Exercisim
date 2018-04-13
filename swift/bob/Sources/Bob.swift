import Foundation

struct Bob {
    
    enum Response: String {
        
        case Sure = "Sure."
        case Chill = "Whoa, chill out!"
        case Fine = "Fine. Be that way!"
        case Whatever = "Whatever."
    }
    
    static func hey(_ input: String) -> String {
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
        return self.last == "?"
    }
    
    var isBlank: Bool {
        return trim.isEmpty
    }
    
    var isYell: Bool {
        return hasUppercaseLetters && !hasLowercaseLetters
    }
    
    var trim: String {
        return trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    var hasUppercaseLetters: Bool {
        return rangeOfCharacter(from: CharacterSet.uppercaseLetters) != nil
    }
    
    var hasLowercaseLetters: Bool {
        return rangeOfCharacter(from: CharacterSet.lowercaseLetters) != nil
    }
}
