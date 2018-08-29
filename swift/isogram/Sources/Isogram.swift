import Foundation

struct Isogram {
    
    static func isIsogram(_ iso: String) -> Bool {
        var dict = [String]()
        var isIso = true
        let letters = iso.unicodeScalars.filter{ CharacterSet.letters.contains($0) }
        
        letters.forEach { (char) in
            let check = String(char).lowercased()
            if dict.contains(check) {
                isIso = false
            }
            dict.append(check)
        }
        
        return isIso
    }
    
}
