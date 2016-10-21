import Foundation

extension Array {
    
    func keep(predicate: (Element) -> Bool) -> [Element] {
        var keepArray = [Element]()
        for item in self {
            if (predicate(item)) {
                keepArray.append(item)
            }
        }
        return keepArray
    }
    
    func discard(predicate: (Element) -> Bool) -> [Element] {
        return keep { !predicate($0) }
    }
}