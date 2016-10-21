import Foundation

class DNA {
    static let nucleotides = "ACGT"
    let strand: String
    
    init?(strand: String) {
        
        guard (strand.characters.filter{ !DNA.nucleotides.characters.contains($0) }).count == 0 else {
            return nil;
        }
        
        self.strand = strand.uppercaseString
    }
    
    func count(nucleotide: Character) -> Int {
        return strand.characters.filter{ $0 == nucleotide }.count
    }
    
    func counts() -> [String : Int] {
        var counts = [String : Int]()
        
        for nucleotied in DNA.nucleotides.characters {
            counts[String(nucleotied)] = count(nucleotied)
        }
        
        return counts
    }
}