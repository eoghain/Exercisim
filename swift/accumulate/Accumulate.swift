import Foundation

extension Array {
    func accumulate<T>(function: (Element) -> T) -> [T] {
        var result: [T] = [T]()
        self.forEach { element in
            result.append(function(element))
        }
        return result
    }
}