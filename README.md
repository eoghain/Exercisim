All of my [Exercism.io](http://exercisim.io) projects done while I'm learning swift.

# Interesting Things

## Errors

[Grains](swift/grains/Grains.swift) - Thowwing an ErrorType enum with with a message.  Check [GrainsTest](swift/grains/Grains.swift) for an example of how to catch errors with embedded messages.

[QueenAttack](swift/queen-attack.QueenAttack.swift) - Embedding validation logic inside of the ErrorType enum for clean methods that look like:
```swift
init(white: [Int] = [0, 3], black: [Int] = [7, 3]) throws {
        try InitError.validateQueens(white, black)
        self.white = white
        self.black = black
    }
```swift
instead of :
```
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