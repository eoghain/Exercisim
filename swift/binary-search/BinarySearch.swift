import Foundation

enum BinarySearchError: ErrorType {
    case unsorted
}

struct BinarySearch {
    
    let list: [Int]
    let middle: Int

    init(_ list:[Int]) throws {
        guard list.isSorted else {
            throw BinarySearchError.unsorted
        }
        
        self.list = list
        self.middle = list.count / 2
    }
    
    func searchFor(num: Int) -> Int? {
        let middleValue = self.list[middle]
        var index: Int?
        switch num {
            case _ where list.count == 2:
                switch num {
                    case _ where num == list[0]: index = 0
                    case _ where num == list[1]: index = 1
                    default: index =  nil
                }
            
            case _ where num == middleValue:
                index = middle
            
            case _ where num < middleValue:
                index = try! BinarySearch(Array(list[0...middle])).searchFor(num)
            
            case _ where num > middleValue:
                index = try! BinarySearch(Array(list[middle..<list.count])).searchFor(num)
                if (index != nil) {
                    index! += middle
                }
            
            default: index = nil
        }
        
        return index
    }
}

extension CollectionType where Generator.Element: Comparable {
    public var isSorted: Bool {
        var previousIndex = startIndex
        var currentIndex = startIndex.successor()

        while currentIndex != endIndex {
            if self[previousIndex] > self[currentIndex] {
                return false
            }
            
            previousIndex = currentIndex
            currentIndex = currentIndex.successor()
        }
        return true
    }
}
