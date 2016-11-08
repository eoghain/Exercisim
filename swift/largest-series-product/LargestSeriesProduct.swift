import Foundation

struct NumberSeries {
    
    let series: String
    
    enum NumberSeriesError: ErrorType {
        case spanLongerThanStringLength, invalidCharacter, negativeSpan
        
        static func validate(series: String, span: Int) throws {
            
            let nonInts = NSCharacterSet.decimalDigitCharacterSet().invertedSet
            
            guard series.rangeOfCharacterFromSet(nonInts) == nil else {
                throw NumberSeriesError.invalidCharacter
            }
            
            guard span >= 0 else {
                throw NumberSeriesError.negativeSpan
            }
            
            guard series.characters.count >= span else {
                throw NumberSeriesError.spanLongerThanStringLength
            }
        }
    }
    
    init(_ series: String) {
        self.series = series
    }
    
    func largestProduct(span: Int) throws -> Int {
        try NumberSeriesError.validate(series, span: span)
        
        guard span > 0 && series.characters.count > 0 else {
            return 1
        }
        
        var largestProduct = 0
        
        for index in series.startIndex..<series.endIndex {
            let spanEnd = index.advancedBy(span - 1)
            if spanEnd >= series.endIndex {
                break
            }
            
            largestProduct = max(largestProduct, series.characters[index...spanEnd].flatMap{ Int(String($0)) }.reduce(1) { $0 * $1 } )
        }
        
        return largestProduct
    }
}
