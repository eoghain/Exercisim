All of my [Exercism.io](http://exercisim.io) projects done while I'm learning swift.

# Interesting Things

## Enums

* [SpaceAge](swift/spave-age/Source/SpaceAge.swift) - Enum with custom values

## Errors

* [Grains](swift/grains/Source/Grains.swift) - Thowing an ErrorType enum with with a message.  Check [GrainsTest](swift/grains/Source/Grains.swift) for an example of how to catch errors with embedded messages.

* [QueenAttack](swift/queen-attack/Source/QueenAttack.swift) - Embedding validation logic inside of the ErrorType enum for clean methods that look like:
```swift
init(white: [Int] = [0, 3], black: [Int] = [7, 3]) throws {
        try InitError.validateQueens(white, black)
        self.white = white
        self.black = black
    }
```
instead of :
```swift
init(white: [Int] = [0, 3], black: [Int] = [7, 3]) throws {
        guard white.count == 2 && black.count == 2 else {
            throw InitError.incorrectNumberOfCoordinates
        }
        guard white[0] != black[0] || white[1] != black[1] else {
            throw InitError.sameSpace
        }
        guard ((white + black).filter { Queens.validRange.contains($0) }).count == 4 else {
            throw InitError.invalidCoordinates
        }
        
        self.white = white
        self.black = black
    }
```

## Extensions

* [CryptoSquare](swift/crypto-square/Source/CryptoSquare.swift) - Extending swift String to do custom processing
* [Clock](swift/clock/Source/Clock.swift) - Extending own class for protocol encapsulation
* [RomanNumerals](swift/roman-numerals/Source/RomanNumerals.swift) - Extending own class for protocol encapsulation
* [RobotName](swift/robot-name/Source/RobotName.swift) - Extending Array & Int
* [Accumulate](swift/accumulate/Source/Accumulate.swift) - Extending Array with Generic function
* [Meetup](swift/accumulate/Source/Meetup.swift) - Extending NSDateFormatter to add a convenience method to build from string
* [Binary](swift/binary/Source/Binary.swift) - Extending Int
* [Bob](swift/bob/Source/Bob.swift) - Extending String

## Operator Overloading

* [Clock](swift/clock/Source/Clock.swift) - Implement == operator to allow custom class/struct to implement the Equatable protocol

## Guarding

* [NucleotideCount](swift/nucleotide-count/Source/NucleotideCount.swift)
* [Binary](swift/binary/Source/Binary.swift) - Extending Int


## Generics

* [Accumulate](swift/accumulate/Source/Accumulate.swift) - Extending Array with Generic function
* [SimpleLinkedList](swift/simple-linked-list/Source/SimpleLinkedList.swift) - Generic class from scratch