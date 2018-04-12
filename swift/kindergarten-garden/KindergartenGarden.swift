import Foundation

struct Garden {
 
    enum Plant: Character {
        case grass = "G"
        case clover = "C"
        case radishes = "R"
        case violets = "V"
    }
    
    let plants: [String]
    let children: [String]
    
    init(_ plants: String, children: [String] = ["Alice", "Bob", "Charlie", "David", "Eve", "Fred", "Ginny", "Harriet", "Ileana", "Joseph", "Kincaid", "Larry"]) {
        
        self.plants = plants.characters.split{$0 == "\n"}.map(String.init)
        self.children = children.sorted()
    }
    
    func plantsForChild(_ child: String) -> [Plant] {
        var childsPlants = [Plant]()
        
        if let childIndex = children.index(of: child) {
            
            let index0 = plants[0].characters.index(plants[0].startIndex, offsetBy: childIndex * 2)
            let index1 = plants[1].characters.index(plants[1].startIndex, offsetBy: childIndex * 2)
            
            let plant1 = plants[0].characters[index0]
            let plant2 = plants[0].characters[plants[0].index(after: index0)]
            let plant3 = plants[1].characters[index1]
            let plant4 = plants[1].characters[plants[1].index(after: index1)]
            
            childsPlants.append(Plant(rawValue: plant1)!)
            childsPlants.append(Plant(rawValue: plant2)!)
            childsPlants.append(Plant(rawValue: plant3)!)
            childsPlants.append(Plant(rawValue: plant4)!)
        }
        
        return childsPlants
    }
}
