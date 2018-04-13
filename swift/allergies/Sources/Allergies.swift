import Foundation

enum Allergy: UInt {
    case
        eggs = 1,
        peanuts = 2,
        shellfish = 4,
        strawberries = 8,
        tomatoes = 16,
        chocolate = 32,
        pollen = 64,
        cats = 128
}

struct Allergies {
    
    let alergyNumber: UInt
    
    init(_ number: UInt) {
        self.alergyNumber = number
    }
    
    func hasAllergy(_ allergy: Allergy) -> Bool {
        return self.alergyNumber & allergy.rawValue > 0
    }
}
