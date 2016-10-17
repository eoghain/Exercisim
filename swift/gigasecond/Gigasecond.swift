import Foundation

class Gigasecond {
    
    let description: String
    private let gigaSecond: Double = pow(10, 9)
    
    init?(from: String) {
        let dateFormatter = NSDateFormatter()
        dateFormatter.timeZone = NSTimeZone(name: "UTC")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        
        if let date = dateFormatter.dateFromString(from) {
            self.description = dateFormatter.stringFromDate(date.dateByAddingTimeInterval(self.gigaSecond))
        } else {
            return nil
        }
    }
}