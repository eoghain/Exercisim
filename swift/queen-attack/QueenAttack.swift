import Foundation

class Queens {
    
    enum InitError: ErrorType {
        case incorrectNumberOfCoordinates
        case invalidCoordinates
        case sameSpace
    }
    
    let white: [Int]
    let black: [Int]
    
    var canAttack: Bool {
        switch true {
            case _ where white[0] == black[0]: fallthrough
            case _ where white[1] == black[1]: fallthrough
            case _ where abs(white[0] - black[0]) == abs(white[1] - black[1]): return true
            default: return false
        }
    }
    
    init(white: [Int] = [0, 3], black: [Int] = [7, 3]) throws {
        guard white.count == 2 && black.count == 2 else {
            throw InitError.incorrectNumberOfCoordinates
        }
        guard white[0] != black[0] || white[1] != black[1] else {
            throw InitError.sameSpace
        }
        guard white[0] >= 0 && white[0] <= 7 && white[1] >= 0 && white[1] <= 7 && black[0] >= 0 && black[0] <= 7 && black[1] >= 0 && black[1] <= 7 else {
            throw InitError.invalidCoordinates
        }
        
        self.white = white
        self.black = black
    }
}

extension Queens: CustomStringConvertible {
    var description: String {
        var output = ""
        for x in 0..<8 {
            for y in 0..<8 {
                switch y {
                case _ where white[0] == x && white[1] == y: output += "W "
                case _ where black[0] == x && black[1] == y: output += "B "
                default: output += "_ "
                }
            }
            output = output.substringToIndex(output.endIndex.predecessor()) + "\n"
        }
    
        return String(output.substringToIndex(output.endIndex.predecessor()))
    }
}