import Foundation

class Element<T: Equatable> {
    
    let value: T?
    var next: Element?
    
    init(_ value: T? = nil, _ next: Element? = nil) {
        self.value = value
        self.next = next
    }
    
    static func fromArray(array: [T]) -> Element<T> {
        guard array.count >= 1 else {
            return Element.init()
        }
        
        var array = array
        var current = Element(array.popLast()!, nil)
        
        array.reverse().forEach { value in
            current = Element(value, current)
        }
        
        return current
    }
    
    func toArray() -> [T] {
        return [value].flatMap { $0 } + (next?.toArray() ?? [])
    }
    
    func reverseElements() -> Element<T> {
        return Element.fromArray(self.toArray().reverse())
    }
}
