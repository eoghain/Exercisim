import Foundation

struct Series {
    
    let series: String
    
    init(_ series: String) {
        self.series = series
    }
    
    func slices(_ length: Int) -> [[Int]] {
        var startIndex = series.startIndex
        var endIndex = series.index(startIndex, offsetBy: length - 1)
        var slices = [Array<Int>]()
        
        while endIndex < series.endIndex {
            let slice:[Int] = series[startIndex...endIndex].map{ Int(String($0))! }
            slices.append(slice)
            startIndex = series.index(startIndex, offsetBy: 1)
            endIndex = series.index(endIndex, offsetBy: 1)
        }
        
        return slices
    }
}
