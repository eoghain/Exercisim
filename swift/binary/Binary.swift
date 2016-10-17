import Foundation

class Binary {
    
    let binaryString: String

    init?(_ binaryString: String) {
        
        if (binaryString.characters.filter{ !"01".characters.contains($0) }).count != 0 {
            return nil
        }
        
        self.binaryString = binaryString
    }
}

extension Int {
    init?(_ binary: Binary?) {
        guard let binary = binary else { return nil }
        
        var value : Int = 0
        var exponent = binary.binaryString.characters.count
        
        binary.binaryString.characters.forEach { (digit) in
            exponent -= 1
            if digit == "1" {
                value += Int(pow(Float(2), Float(exponent)))
            }
        }
        
        self.init(value)
    }
}