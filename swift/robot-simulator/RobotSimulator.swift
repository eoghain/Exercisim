import Foundation

struct SimulatedRobot {
    enum Instructions: Int {
        case TurnRight, Advance, TurnLeft
    }
    
    enum Bearing: Int {
        case north, east, south, west
        
        func turnLeft() -> Bearing {
            if (self == .north)
            {
                return .west
            }
            return Bearing.init(rawValue: self.rawValue - 1)!
        }
        
        func turnRight() -> Bearing {
            if (self == .west)
            {
                return .north
            }
            return Bearing.init(rawValue: self.rawValue + 1)!
        }
    }
    
    var coordinates:[Int] = [0,0]
    var bearing:Bearing = .north
    
    mutating func orient(bearing:Bearing) {
        self.bearing = bearing
    }
    
    mutating func turnRight() {
        bearing = bearing.turnRight()
    }
    
    mutating func turnLeft() {
        bearing = bearing.turnLeft()
    }
    
    mutating func at(x x:Int, y:Int) {
        coordinates = [x,y]
    }
    
    mutating func advance() {
        switch bearing {
            case .north: coordinates = [coordinates[0], coordinates[1] + 1]
            case .east: coordinates = [coordinates[0] + 1, coordinates[1]]
            case .south: coordinates = [coordinates[0], coordinates[1] - 1]
            case .west: coordinates = [coordinates[0] - 1, coordinates[1]]
        }
    }
    
    mutating func place(x x:Int, y:Int, direction:Bearing) {
        coordinates = [x,y]
        bearing = direction
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
        
        return instructions.characters.map {  char in
            switch(char) {
            case "R": return .TurnRight
            case "L": return .TurnLeft
            case "A": return .Advance
            default: return .Advance
            }
        }
    }
}