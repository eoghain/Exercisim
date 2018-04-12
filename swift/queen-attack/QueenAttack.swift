import Foundation

class Queens {
    
    enum InitError: Error {
        case incorrectNumberOfCoordinates
        case invalidCoordinates
        case sameSpace
        
        static func validateQueens(_ white: [Int], _ black: [Int]) throws {
            guard white.count == 2 && black.count == 2 else {
            throw InitError.incorrectNumberOfCoordinates
            }
            guard white[0] != black[0] || white[1] != black[1] else {
            throw InitError.sameSpace
            }
            guard ((white + black).filter { Queens.validRange.contains($0) }).count == 4 else {
            throw InitError.invalidCoordinates
            }
        }
    }
    
    let white: [Int]
    let black: [Int]
    
    fileprivate static let validRange = 0...7
    
    var canAttack: Bool {
        switch true {
            case _ where white[0] == black[0]: fallthrough
            case _ where white[1] == black[1]: fallthrough
            case _ where abs(white[0] - black[0]) == abs(white[1] - black[1]): return true
            default: return false
        }
    }
    
    init(white: [Int] = [0, 3], black: [Int] = [7, 3]) throws {
        try InitError.validateQueens(white, black)
        self.white = white
        self.black = black
    }
}

extension Queens: CustomStringConvertible {
    var description: String {
        return Queens.validRange.map{ col -> String in
            Queens.validRange.map{ row -> String in
                switch (col, row) {
                    case (white[0], white[1]): return "W"
                    case (black[0], black[1]): return "B"
                    default: return "_"
                }
            }.joined(separator: " ")
        }.joined(separator: "\n")
    }
}
