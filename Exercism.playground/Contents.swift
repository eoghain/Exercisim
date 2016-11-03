//: Playground - noun: a place where people can play

import Foundation


let foo = [1].flatMap { $0 }
print(foo)
let bar = foo + [2]
print(bar)
let baz = bar + []
print(baz)

print ([1].flatMap{$0} + [2])
print ([1] + [2])
