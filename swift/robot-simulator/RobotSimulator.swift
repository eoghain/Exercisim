import Foundation

struct SimulatedRobot {
    enum Instructions: Character {
        case turnRight = "R"
        case turnLeft = "L"
        case advance = "A"
    }
    
    enum Bearing {
        case north, east, south, west
    }
    
    fileprivate var position: (x:Int, y:Int) = (0,0)
    
    var coordinates:[Int] {
        return [position.x, position.y]
    }
    var bearing:Bearing = .north
    
    mutating func orient(_ bearing:Bearing) {
        self.bearing = bearing
    }
    
    mutating func turnRight() {
        switch bearing {
            case .north: orient(.east)
            case .east: orient(.south)
            case .south: orient(.west)
            case .west: orient(.north)
        }
    }
    
    mutating func turnLeft() {
        switch bearing {
            case .north: orient(.west)
            case .west: orient(.south)
            case .south: orient(.east)
            case .east: orient(.north)
        }
    }
    
    mutating func at(x:Int, y:Int) {
        position.x = x
        position.y = y
    }
    
    mutating func advance() {
        switch bearing {
            case .north: position.y += 1
            case .east: position.x += 1
            case .south: position.y -= 1
            case .west: position.x -= 1
        }
    }
    
    mutating func place(x:Int, y:Int, direction:Bearing) {
        at(x:x, y:y)
        orient(direction)
    }
    
    mutating func evaluate(_ instructions:String) {
        self.instructions(instructions).forEach { instruction in
            switch instruction {
                case .turnRight: self.turnRight()
                case .turnLeft: self.turnLeft()
                case .advance: self.advance()
            }
        }
    }
    
    func instructions(_ instructions:String) -> [Instructions] {
        return instructions.characters.flatMap { Instructions(rawValue: $0) }
    }
}
