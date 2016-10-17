import Foundation

struct Meetup {
    
    let year: Int
    let month: Int
    let weekday: Int
    let which: String
    
    var description: String {
        let dateComponents = NSDateComponents()
        dateComponents.calendar = NSCalendar.currentCalendar()
        dateComponents.year = self.year
        dateComponents.month = self.month
        dateComponents.weekday = self.weekday
        
        if (self.which == "teenth") {
            dateComponents.weekdayOrdinal = self.weekday % 7 == 0 ? 3 : 2
        } else {
            switch self.which {
            case "1st":
                dateComponents.weekdayOrdinal = 1
            case "2nd":
                dateComponents.weekdayOrdinal = 2
            case "3rd":
                dateComponents.weekdayOrdinal = 3
            case "4th":
                dateComponents.weekdayOrdinal = 4
            case "last":
                dateComponents.weekdayOrdinal = 5
            default:
                break
            }
        }
        
        return NSDateFormatter("YYYY-MM-dd").stringFromDate(dateComponents.date!)
    }
    
    init (year: Int, month: Int) {
        self.year = year
        self.month = month
        self.weekday = 1
        self.which = "1st"
    }
    
    init (year: Int, month: Int, day: Int, which: String) {
        self.year = year
        self.month = month
        self.weekday = day
        self.which = which
    }
    
    func day(day: Int, which: String) -> Meetup {
        return Meetup(year: self.year, month: self.month, day: day, which: which)
    }
    
}

extension NSDateFormatter {
    
    convenience init(_ format: String) {
        self.init()
        self.dateFormat = format
    }
}
