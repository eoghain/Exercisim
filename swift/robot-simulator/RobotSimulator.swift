import Foundation

struct SimulatedRobot {
    enum Instructions: Character {
        case TurnRight = "R"
        case TurnLeft = "L"
        case Advance = "A"
    }
    
    enum Bearing {
        case north, east, south, west
    }
    
    private var position: (x:Int, y:Int) = (0,0)
    
    var coordinates:[Int] {
        return [position.x, position.y]
    }
    var bearing:Bearing = .north
    
    mutating func orient(bearing:Bearing) {
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
    
    mutating func at(x x:Int, y:Int) {
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
    
    mutating func place(x x:Int, y:Int, direction:Bearing) {
        at(x:x, y:y)
        orient(direction)
    }
    
    mutating func evaluate(instructions:String) {
        self.instructions(instructions).forEach { instruction in
            switch instruction {
                case .TurnRight: self.turnRight()
                case .TurnLeft: self.turnLeft()
                case .Advance: self.advance()
            }
        }
    }
    
    func instructions(instructions:String) -> [Instructions] {
        return instructions.characters.map { Instructions(rawValue: $0)! }
    }
}