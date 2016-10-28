import Foundation

struct Series {
    
    let series: String
    
    init(_ series: String) {
        self.series = series
    }
    
    func slices(length: Int) -> [[Int]] {
        var startIndex = series.startIndex
        var endIndex = startIndex.advancedBy(length - 1)
        var slices = [Array<Int>]()
        
        while endIndex < series.endIndex {
            let slice:[Int] = series[startIndex...endIndex].characters.map{ Int(String($0))! }
            slices.append(slice)
            startIndex = startIndex.advancedBy(1)
            endIndex = endIndex.advancedBy(1)
        }
        
        return slices
    }
}
