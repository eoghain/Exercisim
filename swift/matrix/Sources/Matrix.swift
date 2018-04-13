import Foundation

struct Matrix {
    
    let rows: [[Int]]
    let columns: [[Int]]
    
    init (_ matrix: String) {
        let rowSplit = matrix.split(separator: "\n").map{ String($0) }
        rows = rowSplit.map{ $0.split(separator: " ").flatMap{ Int(String($0)) } }
        
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
    }
}
