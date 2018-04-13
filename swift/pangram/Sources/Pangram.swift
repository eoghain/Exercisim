import Foundation

struct Pangram {
    
    static let letters = "abcdefghijklmnopqrstuvwxyz"
    
    static func isPangram(_ text: String) -> Bool {
        guard text.count >= letters.count else {
            return false
        }
        
        let lower = text.lowercased()
                
        return Pangram.letters.reduce(true) { (pangram: Bool, char: Character) in
            guard pangram == true else { return false }
            return lower.contains(char) == pangram
        }
    }
}
