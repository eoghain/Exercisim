//: Playground - noun: a place where people can play

import Foundation


let phrases: [(item:String,action:String)] = [
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

func verse(number: Int) -> String {
    
    var verse = phrases.reversed()[0...number].reversed().reduce("") { (song: String, line: (item:String,action:String)) in
            return song + "the \(line.item)\nthat \(line.action) "
    }
    verse = String(verse.characters.dropLast(7)) // remove last \nthat\n

    return "This is \(verse) that Jack built."
}

//This is the rat
//that ate the malt
//that lay in the house that Jack built.

//let song = (0..<phrases.count).reduce("") { return $0 + verse(number:$1) }
let song = (0..<phrases.count).map { verse(number:$0) }.joined(separator: "\n\n")
print (song)
