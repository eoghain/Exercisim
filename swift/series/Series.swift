import Foundation

struct Series {
    
    let series: String
    
    init(_ series: String) {
        self.series = series
    }
    
    func slices(_ length: Int) -> [[Int]] {
        var startIndex = series.startIndex
        var endIndex = <#T##Collection corresponding to `startIndex`##Collection#>.index(startIndex, offsetBy: length - 1)
        var slices = [Array<Int>]()
        
        while endIndex < series.endIndex {
            let slice:[Int] = series[startIndex...endIndex].characters.map{ Int(String($0))! }
            slices.append(slice)
            startIndex = <#T##Collection corresponding to `startIndex`##Collection#>.index(startIndex, offsetBy: 1)
            endIndex = <#T##Collection corresponding to `endIndex`##Collection#>.index(endIndex, offsetBy: 1)
        }
        
        return slices
    }
}
