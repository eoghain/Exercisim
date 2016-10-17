import Foundation

struct Garden {
 
    enum Plant: Character {
        case Grass = "G"
        case Clover = "C"
        case Radishes = "R"
        case Violets = "V"
    }
    
    let plants: [String]
    let children: [String]
    
    init(_ plants: String, children: [String] = ["Alice", "Bob", "Charlie", "David", "Eve", "Fred", "Ginny", "Harriet", "Ileana", "Joseph", "Kincaid", "Larry"]) {
        
        self.plants = plants.characters.split{$0 == "\n"}.map(String.init)
        self.children = children.sort()
    }
    
    func plantsForChild(child: String) -> [Plant] {
        var childsPlants = [Plant]()
        
        if let childIndex = children.indexOf(child) {
            
            let index0 = plants[0].startIndex.advancedBy(childIndex * 2)
            let index1 = plants[1].startIndex.advancedBy(childIndex * 2)
            
            let plant1 = plants[0].characters[index0]
            let plant2 = plants[0].characters[index0.successor()]
            let plant3 = plants[1].characters[index1]
            let plant4 = plants[1].characters[index1.successor()]
            
            childsPlants.append(Plant(rawValue: plant1)!)
            childsPlants.append(Plant(rawValue: plant2)!)
            childsPlants.append(Plant(rawValue: plant3)!)
            childsPlants.append(Plant(rawValue: plant4)!)
        }
        
        return childsPlants
    }
}