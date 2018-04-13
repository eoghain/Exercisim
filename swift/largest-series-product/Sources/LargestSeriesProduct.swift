import Foundation

struct NumberSeries {
    
    let series: String
    
    enum NumberSeriesError: Error {
        case spanLongerThanStringLength, invalidCharacter, negativeSpan
        
        static func validate(_ series: String, span: Int) throws {
            
            let nonInts = CharacterSet.decimalDigits.inverted
            
            guard series.rangeOfCharacter(from: nonInts) == nil else {
                throw NumberSeriesError.invalidCharacter
            }
            
            guard span >= 0 else {
                throw NumberSeriesError.negativeSpan
            }
            
            guard series.count >= span else {
                throw NumberSeriesError.spanLongerThanStringLength
            }
        }
    }
    
    init(_ series: String) {
        self.series = series
    }
    
    func largestProduct(_ span: Int) throws -> Int {
        try NumberSeriesError.validate(series, span: span)
        
        guard span > 0 && series.count > 0 else { return 1 }
        
        var largestProduct = 0
        
        let digits = series.compactMap{ Int(String($0)) }
        
        for index in 0...digits.count - span {
            largestProduct = max(largestProduct, digits[index..<index + span].reduce(1, *))
        }

        return largestProduct
    }
}
