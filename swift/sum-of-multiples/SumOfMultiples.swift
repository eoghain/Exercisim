import Foundation

struct SumOfMultiples {
    
    static func toLimit(_ limit: UInt, inMultiples: [UInt]) -> UInt {
        // Remove 0's
        let validMultipliers = inMultiples.filter { $0 > 0 }
        
        // Filter out non-multiple numbers
        let multiples = (1..<limit).filter { number in
            var multipleOf: Bool = false
            validMultipliers.forEach({ if (number % $0) == 0 { multipleOf = true } })
            return multipleOf
        }
        
        // Sum all multiples
        return multiples.reduce(0, +)
    }
}
