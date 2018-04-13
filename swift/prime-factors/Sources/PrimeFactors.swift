import Foundation

struct PrimeFactors {

    let value: Int
    
    var toArray: [Int] {
        var currentValue = value
        var primeFactors = [Int]()
        var factor = 2;
        
        while (currentValue > 1) {
            if (currentValue % factor != 0) {
                factor += 1
                continue
            }
            
            currentValue /= factor
            primeFactors.append(factor)
        }
        
        return primeFactors
    }

    init(_ value: Int) {
        self.value = value
    }
    
}
