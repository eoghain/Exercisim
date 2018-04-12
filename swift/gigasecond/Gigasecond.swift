import Foundation

class Gigasecond {
    
    let description: String
    fileprivate let gigaSecond: Double = pow(10, 9)
    
    init?(from: String) {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        
        if let date = dateFormatter.date(from: from) {
            self.description = dateFormatter.string(from: date.addingTimeInterval(self.gigaSecond))
        } else {
            return nil
        }
    }
}
