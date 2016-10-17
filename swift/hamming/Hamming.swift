//
//  Hamming.swift
//  Project
//
//  Created by Booth, Robert on 1/21/16.
//  Copyright © 2016 Booth, Robert. All rights reserved.
//

import Foundation

struct Hamming {
    
    static func compute(ref: String, against: String) -> Int? {
        // hamming distance is only defined for strings with equal length
        guard (ref.characters.count == against.characters.count) else {
            return nil
        }
        
        return zip(ref.characters, against.characters).filter({$0 != $1}).count
    }
}