import Foundation

struct Triangle {
    
    let sides: (a: Double, b: Double, c: Double)
    
    var kind: String {
        
        switch self.sides {
        // Any side is 0
        case let (a,b,c) where (a == 0 || b == 0 || c == 0):
            return "ErrorKind"
            
        // Sum of any 2 sides is greater than the 3rd
        case let (a,b,c) where (a + b < c) || (a + c < b) || (b + c < a):
            return "ErrorKind"
            
        // All sides equal
        case let (a,b,c) where (a == b && b == c):
            return "Equilateral"
            
        // Any 2 sides equal (relies on All sides equal test first)
        case let (a,b,c) where (a == b) || (a == c) || (b == c):
            return "Isosceles"
            
        // All other triangles
        default:
            return "Scalene"
        }
    }
    
    init(_ a: Double, _ b: Double, _ c: Double) {
        self.sides = (a,b,c)
    }
}