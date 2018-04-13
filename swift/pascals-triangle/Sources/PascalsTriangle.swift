import Foundation

struct PascalsTriangle {
    
    let rows: [[Int]]
    
    init(_ size: Int) {
        var newRows = [[Int]]()
        
        for rowNumber in (1...size) {
            if let previousRow = newRows.last {
                var newRow = [Int]()
                for itemNumber in (0..<rowNumber) {
                    guard itemNumber > 0 && (itemNumber + 1) <= previousRow.count else {
                        newRow.append(1)
                        continue
                    }
                    
                    newRow.append(previousRow[itemNumber - 1] + previousRow[itemNumber])
                }
                
                newRows.append(newRow)
            }
            else {
                newRows.append([1])
            }
        }
        
        rows = newRows
    }
}
