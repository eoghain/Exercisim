import Foundation

struct SecretHandshake: OptionSet {
    
    let rawValue: Int

    static let None        = SecretHandshake(rawValue: 0)
    static let Wink        = SecretHandshake(rawValue: 1 << 0)
    static let DoubleBlink = SecretHandshake(rawValue: 1 << 1)
    static let CloseEyes   = SecretHandshake(rawValue: 1 << 2)
    static let Jump        = SecretHandshake(rawValue: 1 << 3)
    static let Reverse     = SecretHandshake(rawValue: 1 << 4)
    
    fileprivate var description: String {
        switch self {
            case SecretHandshake.None: return ""
            case SecretHandshake.Wink: return "wink"
            case SecretHandshake.DoubleBlink: return "double blink"
            case SecretHandshake.CloseEyes: return "close your eyes"
            case SecretHandshake.Jump: return "jump"
            default: return "complex handshake"
        }
    }
    
    var commands: [String] {
        var commands = [String]()
        
        for shift in 0...3 {
            let step = SecretHandshake(rawValue: 1 << shift)
            if self.contains(step) {
                commands.append(step.description)
            }
        }
        
        if self.contains(SecretHandshake.Reverse) {
            commands = commands.reversed()
        }
        
        return commands
    }
    
    init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    init(_ rawValue: Int) {
        self.init(rawValue: rawValue)
    }
}
