import Foundation

struct Squares {
    
    let squares: Int
    
    var squareOfSums: Int {
        let sum = (1...squares).reduce(0, combine: +)
        return sum * sum
    }
    
    var sumOfSquares: Int {
        return (1...squares).map{ $0 * $0 }.reduce(0, combine: +)
    }
    
    var differenceOfSquares: Int {
        return squareOfSums - sumOfSquares
    }
    
    init(_ squares: Int) {
        self.squares = squares
    }
}