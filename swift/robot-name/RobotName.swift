import Foundation

class RandomNameGenerator {
    
    fileprivate static var generatedNames = [String]()
    fileprivate static let letters = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ".characters)
    
    class func randomName() -> String {
        var name: String
        
        repeat {
            name = "\(letters.random())\(letters.random())\(String(format:"%03d",Int(random: 999)))"
        } while generatedNames.contains(name) == true
        
        generatedNames.append(name)
        
        return name
    }
}

struct Robot {
    var name = RandomNameGenerator.randomName()
    
    mutating func resetName() {
        name = RandomNameGenerator.randomName()
    }
}

extension Array {
    func random() -> Element {
        return self[Int(random:self.count)]
    }
}

extension Int {
    init (random: Int) {
        self.init(arc4random_uniform(UInt32(random)))
    }
}
