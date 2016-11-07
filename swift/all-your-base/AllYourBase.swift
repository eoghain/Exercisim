import Foundation

enum BaseError: ErrorType {
    case invalidOutputBase, invalidInputBase, invalidPositiveDigit, negativeDigit
    
    static func validate(inputBase inputBase: Int, inputDigits: [Int], outputBase: Int) throws {
        guard inputBase > 1 else {
            throw BaseError.invalidInputBase
        }
        
        guard outputBase > 1 else {
            throw BaseError.invalidOutputBase
        }
        
        guard (inputDigits.filter{ $0 >= inputBase }.count == 0) else {
            throw BaseError.invalidPositiveDigit
        }
        
        guard (inputDigits.filter{ $0 < 0 }.count == 0) else {
            throw BaseError.negativeDigit
        }
    }
}

struct Base {
    
    static func outputDigits(inputBase inputBase: Int, inputDigits: [Int], outputBase: Int) throws -> [Int] {
        try BaseError.validate(inputBase: inputBase, inputDigits: inputDigits, outputBase: outputBase)
        
        var outputDigits = [Int]()
        var number: Int = 0
        
        for (index, digit) in inputDigits.reverse().enumerate() {
            number += digit * Int(pow(Double(inputBase), Double(index)))
        }

        while number > 0 {
            outputDigits.append(number % outputBase)
            number /= outputBase
        }
        
        return outputDigits.reverse()
    }
}
