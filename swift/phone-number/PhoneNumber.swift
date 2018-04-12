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
        let index = self.number.characters.index(self.number.startIndex, offsetBy: 3)
        let index2 = self.number.characters.index(index, offsetBy: 3)
        return self.number.substring(with: index..<index2)
    }
    
    var lineNumber: String {
        let index = self.number.characters.index(self.number.endIndex, offsetBy: -4)
        return self.number.substring(from: index)
    }
    
    var areaCode: String {
        let index = self.number.characters.index(self.number.startIndex, offsetBy: 3)
        return self.number.substring(to: index)
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
