import Foundation

struct RnaTranscription {
    static let mapping: [Character:String] = ["G" : "C", "C" : "G", "T" : "A", "A" : "U"]

    enum TranscriptionError: Error {
        case invalidNucleotide
    }
    
    static func validate(_ nucelotide: String) throws {
        guard nucelotide.filter({ RnaTranscription.mapping[$0] == nil }).count == 0 else {
            throw TranscriptionError.invalidNucleotide
        }
    }
    
    static func transcribe(_ nucleotide: String) throws -> String {
        try validate(nucleotide)
        return nucleotide.compactMap{ RnaTranscription.mapping[$0] }.joined(separator: "")
    }
}

struct Nucleotide {
    
    let nucleotide: String
    
    func complementOfDNA() throws -> String {
        return try RnaTranscription.transcribe(nucleotide)
    }
    
    init (_ nucleotide: String) {
        self.nucleotide = nucleotide
    }
}
