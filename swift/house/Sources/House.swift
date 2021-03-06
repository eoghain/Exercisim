import Foundation

struct House {
    
    static let phrases: [(item:String,action:String)] = [
        (item: "horse and the hound and the horn", action: "belonged to"),
        (item: "farmer sowing his corn", action: "kept"),
        (item: "rooster that crowed in the morn", action: "woke"),
        (item: "priest all shaven and shorn", action: "married"),
        (item: "man all tattered and torn", action: "kissed"),
        (item: "maiden all forlorn", action: "milked"),
        (item: "cow with the crumpled horn", action: "tossed"),
        (item: "dog", action: "worried"),
        (item: "cat", action: "killed"),
        (item: "rat", action: "ate"),
        (item: "malt", action: "lay in"),
        (item: "house", action:"")
    ]
    
    static func verse(_ number: Int) -> String {
        
        var verse = phrases
            .reversed()[0...number]
            .reversed()
            .reduce("") { (song: String, line: (item:String,action:String)) in
                return song + "the \(line.item)\nthat \(line.action) "
            }
        verse = String(verse.dropLast(7)) // remove last "\nthat\n "
        
        return "This is \(verse) that Jack built."
    }
    
    static func recite() -> String {
        return (0..<phrases.count)
            .map { verse($0) }
            .joined(separator: "\n\n")
    }
}
