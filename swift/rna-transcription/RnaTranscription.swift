import Foundation

struct Nucleotide {
    
    let nucleotide: String
    let mapping: [Character:String] = ["G" : "C", "C" : "G", "T" : "A", "A" : "U"]
    
    var complementOfDNA: String {
        return nucleotide.characters.map{ mapping[$0]! }.joined(separator: "")
    }
    
    init (_ nucleotide: String) {
        self.nucleotide = nucleotide
    }
}
