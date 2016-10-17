//
//  PhoneNumber.swift
//  Exercism
//
//  Created by Robert Booth on 5/4/16.
//  Copyright © 2016 Robert Booth. All rights reserved.
//

import Foundation

class PhoneNumber: CustomStringConvertible {
    
    let number: String
    
    var prefix: String {
        let index = self.number.startIndex.advancedBy(3)
        let index2 = index.advancedBy(3)
        return self.number.substringWithRange(index..<index2)
    }
    
    var lineNumber: String {
        let index = self.number.endIndex.advancedBy(-4)
        return self.number.substringFromIndex(index)
    }
    
    var areaCode: String {
        let index = self.number.startIndex.advancedBy(3)
        return self.number.substringToIndex(index)
    }
    
    var description: String {
        return "(\(self.areaCode)) \(self.prefix)-\(self.lineNumber)"
    }
    
    init (_ number: String) {
        let numbers = Set("0123456789".characters)
        let filtered = String(number.characters.filter { numbers.contains($0) })
        
        switch filtered.characters.count {
            case 10:
                self.number = filtered
            case 11 where String(filtered.characters.first!) == "1":
                self.number = String(filtered.characters.dropFirst())
            default:
                self.number = "0000000000"
        }
    }
}