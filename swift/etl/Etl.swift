import Foundation

struct ETL {
    
    static func transform(old: [Int: [String]]) -> [String: Int] {
        var transform = [String: Int]()
        
        for (pointValue, keys) in old {
            for letter in keys {
                transform[letter.lowercaseString] = pointValue
            }
        }
        
        return transform
    }
}