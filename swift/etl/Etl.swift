import Foundation

struct ETL {
    
    static func transform(_ old: [Int: [String]]) -> [String: Int] {
        var transform = [String: Int]()
        
        for (pointValue, keys) in old {
            for letter in keys {
                transform[letter.lowercased()] = pointValue
            }
        }
        
        return transform
    }
}
