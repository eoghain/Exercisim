import Foundation

struct Hamming {
    
    static func compute(_ ref: String, against: String) -> Int? {
        // hamming distance is only defined for strings with equal length
        guard (ref.count == against.count) else {
            return nil
        }
        
        return zip(ref, against).filter({$0 != $1}).count
    }
}
