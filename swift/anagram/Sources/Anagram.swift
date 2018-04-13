//
//  Anagram.swift
//  Project
//
//  Created by Booth, Robert on 2/5/16.
//  Copyright © 2016 Booth, Robert. All rights reserved.
//

import Foundation

struct Anagram {
    
    var word: String?
    
    init(word: String) {
        self.word = word.lowercased()
    }
    
    func match(_ words: [String]) -> [String] {
        var anagrams: [String] = []
        
        guard let testWord = self.word else {
            return anagrams
        }
        
        let sortedTestWord = testWord.map { String($0) }.sorted().joined(separator: "")
        
        words.forEach { (word) -> () in
            let lowercaseWord = word.lowercased()
            if (testWord != lowercaseWord) {
                let sortedWord = lowercaseWord.map { String($0) }.sorted().joined(separator: "")
                if let hamming = Hamming.compute(sortedTestWord, against:sortedWord) {
                    if hamming == 0 {
                        anagrams.append(word)
                    }
                }
            }
        }
        
        return anagrams
    }
}
