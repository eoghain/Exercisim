import Foundation

struct Pangram {
    
    static let letters = "abcdefghijklmnopqrstuvwxyz"
    
    static func isPangram(_ text: String) -> Bool {
        guard text.characters.count >= letters.characters.count else {
            return false
        }
        
        let lower = text.lowercased()
        
        return Pangram.letters.characters.reduce(true) { (pangram: Bool, char: Character) in
            return lower.characters.contains(char) == pangram ? true : false
        }
    }
}
