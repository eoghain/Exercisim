import Foundation

struct Clock: Equatable {
    
    let totalMinutes: Int

    var hour: Int {
        let simpleHours = (totalMinutes / 60) % 24
        let hours = (totalMinutes % 60) >= 0 ? simpleHours : simpleHours - 1
        return hours >= 0 ? hours : hours + 24
    }
    
    var minute: Int {
        let minutes = totalMinutes % 60
        return minutes >= 0 ? minutes : minutes + 60
    }
    
    init(hours: Int = 0, minutes:Int = 0) {
        totalMinutes = (hours * 60) + minutes
    }
    
    func add(_ hours: Int = 0, minutes: Int = 0) -> Clock {
        let newMinutes = totalMinutes + ((hours * 60) + minutes)
        return Clock(hours: 0, minutes: newMinutes)
    }
    
    func subtract(_ hours: Int = 0, minutes: Int = 0) -> Clock {
        let newMinutes = totalMinutes - ((hours * 60) + minutes)
        return Clock(hours: 0, minutes: newMinutes)
    }
}

extension Clock: CustomStringConvertible {
    var description: String {
        return String(format: "%02d:%02d", hour, minute)
    }
}

func ==(lhs: Clock, rhs: Clock) -> Bool {
    return lhs.hour == rhs.hour && lhs.minute == rhs.minute
}
