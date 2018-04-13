import Foundation

enum NumberClassification {
    case perfect, abundant, deficient
}

struct NumberClassifier {
       
    let number: Int
    
    var classification: NumberClassification {
        let factors = (1...number/2).filter{ number % $0 == 0 }
        let sum = factors.reduce(0, +)
        
        switch sum {
            case _ where sum > number:
                return .abundant
            case _ where sum < number:
                return .deficient
            default:
                return .perfect
        }
    }
}
