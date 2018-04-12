import Foundation

struct SaddlePointsMatrix {
    
    let rows: [[Int]]
    let columns: [[Int]]
    let saddlePoints: [[Int]]
    
    init (_ matrix: String) {
        let rowSplit = matrix.characters.split(separator: "\n").map{ String($0) }
        rows = rowSplit.map{ $0.characters.split(separator: " ").flatMap{ Int(String($0)) } }
        
        var cols = [[Int]]()
        for _ in 0..<rows[0].count {
            cols.append([Int]())
        }
        
        rows.forEach{ (row: [Int]) in
            for (colIndex, value) in row.enumerated() {
                cols[colIndex].append(value)
            }
        }
        
        columns = cols
        
        func minInCol(_ array: [[Int]], value: Int, column: Int) -> Bool {
            return array.reduce(true) { value > $1[column] ? false : $0 }
        }
        
        var points: [[Int]] = [[Int]()]
        for (rIndex, row) in rows.enumerated() {
            let maxRow = row.reduce(0) { return max($0,$1) }
            
            for (cIndex, cell) in row.enumerated() {
                let isMinCol = rows.reduce(true) { cell > $1[cIndex] ? false : $0 }
                if cell == maxRow && isMinCol {
                    points.append([rIndex, cIndex])
                }
            }
        }
        
        saddlePoints = points.count > 1 ? Array(points.dropFirst()) : points
    }
}
