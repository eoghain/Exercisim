import Foundation


struct Scrabble {
    
    static let tileScores = [
        1  : ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"],
        2  : ["D", "G"],
        3  : ["B", "C", "M", "P"],
        4  : ["F", "H", "V", "W", "Y"],
        5  : ["K"],
        8  : ["J", "X"],
        10 : ["Q", "Z"]
    ]
    
    let word: String?
    
    var score: Int {
        return Scrabble.score(self.word)
    }
    
    init(_ word: String?) {
        self.word = word;
    }
    
    static func score(_ word: String?) -> Int {
        guard let unwrappedWord = word else {
            return 0
        }
        
        let tiles = unwrappedWord.uppercased()
        return tiles.reduce(0) { score, tile in score + tileScore(tile) }
    }
    
    static func tileScore(_ tile: Character) -> Int {
        for (score, tiles) in Scrabble.tileScores
        {
            if (tiles.contains(String(tile)))
            {
                return score
            }
        }
        return 0
    }
}
