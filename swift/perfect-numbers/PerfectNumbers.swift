import Foundation

enum NumberClassification {
    case Perfect, Abundant, Deficient
}

struct NumberClassifier {
       
    let number: Int
    
    var classification: NumberClassification {
        let factors = (1...number/2).filter{ number % $0 == 0 }
        let sum = factors.reduce(0, combine: +)
        
        switch sum {
            case _ where sum > number:
                return .Abundant
            case _ where sum < number:
                return .Deficient
            default:
                return .Perfect
        }
    }
}