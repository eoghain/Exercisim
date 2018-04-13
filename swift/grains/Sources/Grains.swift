import Foundation

struct Grains {
    
    enum GrainsError: Error {
        case inputTooHigh(String)
        case inputTooLow(String)
    }
    
    static let total: UInt64 = ~0 // funky bitwise operation
    
    static func message(_ value:Int) -> String {
        return "Input[\(value)] invalid. Input should be between 1 and 64 (inclusive)"
    }
    
    static func square(_ square: Int) throws -> UInt64 {
        switch square {
            case _ where square < 1:
                throw Grains.GrainsError.inputTooLow(message(square))
            case _ where square > 64:
                throw Grains.GrainsError.inputTooHigh(message(square))
            default:
                return UInt64(1) << UInt64(square - 1) // Bit shifting in action, wear a hardhat!
        }
    }
}
