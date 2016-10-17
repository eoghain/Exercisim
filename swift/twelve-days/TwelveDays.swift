import Foundation

struct TwelveDaysSong {
    static let verseMap = [
        ("first", "a Partridge in a Pear Tree"),
        ("second", "two Turtle Doves"),
        ("third", "three French Hens"),
        ("fourth", "four Calling Birds"),
        ("fifth", "five Gold Rings"),
        ("sixth", "six Geese-a-Laying"),
        ("seventh", "seven Swans-a-Swimming"),
        ("eighth", "eight Maids-a-Milking"),
        ("ninth", "nine Ladies Dancing"),
        ("tenth", "ten Lords-a-Leaping"),
        ("eleventh", "eleven Pipers Piping"),
        ("twelfth", "twelve Drummers Drumming")
    ]
    
    static func verse(verse: Int) -> String {
        return "On the \(TwelveDaysSong.verseMap[verse - 1].0) day of Christmas my true love gave to me, \(TwelveDaysSong.versesTo(verse)).\n"
    }
    
    static func versesTo(verse: Int) -> String {
        return (0..<verse).reverse().reduce(""){
            (allVerses: String, verseNumber: Int) in
            let and = (verse > 1 && verseNumber == 0) ? "and " : ""
            let sep = (verseNumber == 0) ? "" : ", "
            return "\(allVerses)\(and)\(TwelveDaysSong.verseMap[verseNumber].1)\(sep)"
        }
    }
    
    static func verses(start: Int, _ end: Int) -> String {
        return (start...end).reduce(""){ "\($0)\(TwelveDaysSong.verse($1))\n" }
    }
    
    static func sing() -> String {
        return TwelveDaysSong.verses(1, 12)
    }
}