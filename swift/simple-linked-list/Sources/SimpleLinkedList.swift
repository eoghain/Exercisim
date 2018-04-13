import Foundation

class Element<T: Equatable> {
    
    let value: T?
    var next: Element?
    
    init(_ value: T? = nil, _ next: Element? = nil) {
        self.value = value
        self.next = next
    }
    
    static func fromArray(_ array: [T]) -> Element<T> {
        return array.reversed().reduce(Element<T>()) { Element($1, $0) }
    }
    
    func toArray() -> [T] {
        return [value].compactMap { $0 } + (next?.toArray() ?? [])
    }
    
    func reverseElements() -> Element<T> {
        return Element.fromArray(self.toArray().reversed())
    }
}
