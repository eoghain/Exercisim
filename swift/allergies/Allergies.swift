import Foundation

enum Allergy: UInt {
    case
        Eggs = 1,
        Peanuts = 2,
        Shellfish = 4,
        Strawberries = 8,
        Tomatoes = 16,
        Chocolate = 32,
        Pollen = 64,
        Cats = 128
}

struct Allergies {
    
    let alergyNumber: UInt
    
    init(_ number: UInt) {
        self.alergyNumber = number
    }
    
    func hasAllergy(allergy: Allergy) -> Bool {
        return self.alergyNumber & allergy.rawValue > 0
    }
}