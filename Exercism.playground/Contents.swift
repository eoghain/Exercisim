//: Playground - noun: a place where people can play

import Foundation


let matrix = "1 2\n10 20"

let rowSplit = matrix.characters.split(separator: "\n").map{ String($0) }
let numbers = rowSplit.map{ $0.characters.split(separator: " ").map{ Int(String($0)) } }
print(numbers)


let reverseMatrix = String(matrix.characters.reversed())
print(reverseMatrix)
let reverseRowSplit = reverseMatrix.characters.split(separator: "\n").map{ String($0) }
let fixedReverseRowSplit = reverseRowSplit.map{ String($0.characters.reversed()) }
print("1:\(fixedReverseRowSplit)")
let reverseNumbers = fixedReverseRowSplit.map{ $0.characters.split(separator: " ").map{ Int(String($0)) } }
print(reverseRowSplit)
print(reverseNumbers)

//let strRows = matrix.characters.split(separator: "\n").map{ String($0).characters.split(separator: " ").map{ Int(String($0)) } }.flatMap{ $0 }
//let intRows = strRows.map{ $0.characters.split(separator: " ").map{ Int(String($0)) } }
//print("strRows: \(strRows)")
//print("strRowsNoSpaces: \(strRowsNoSpaces)")
//print("intRows: \(intRows)")
