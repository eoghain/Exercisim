//
//  Etl.swift
//  Project
//
//  Created by Booth, Robert on 2/5/16.
//  Copyright © 2016 Booth, Robert. All rights reserved.
//

import Foundation

struct ETL {
    
    static func transform(old: [Int: [String]]) -> [String: Int] {
        var transform = [String: Int]()
        
        for (pointValue, keys) in old {
            for letter in keys {
                transform[letter.lowercaseString] = pointValue
            }
        }
        
        return transform
    }
}