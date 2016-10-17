import Foundation

struct RomanNumeral {
    
    let romanNumeral: UInt
    
    let romanNumerals: [ (numeral: String, value: UInt) ] = [
        ( "I" , 1 ),
        ( "IV", 4 ),
        ( "V" , 5 ),
        ( "IX", 9 ),
        ( "X" , 10 ),
        ( "XL", 40 ),
        ( "L" , 50 ),
        ( "XC", 90 ),
        ( "C" , 100 ),
        ( "CD", 400 ),
        ( "D" , 500 ),
        ( "CM", 900 ),
        ( "M" , 1000 ),
    ]
    
    init(_ number: UInt) {
        self.romanNumeral = number
    }
}

extension RomanNumeral: CustomStringConvertible {
    var description: String {
        
        var val = romanNumeral;
        var output = ""
        
        romanNumerals.reverse().forEach { (numeral: String, value: UInt) in
            while (val >= value) {
                val -= value
                output += numeral
            }
        }
        
        return output
    }
}