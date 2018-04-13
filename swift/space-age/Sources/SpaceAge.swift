import Foundation

enum OrbitalDifference: Float {
    case
        earth   = 1,
        mercury = 0.2408467,
        venus   = 0.61519726,
        mars    = 1.8808158,
        jupiter = 11.862615,
        saturn  = 29.447498,
        uranus  = 84.016846,
        neptune = 164.79132
}

struct SpaceAge {
    
    static let secondsInEarthYear: Float = 31557600
    let seconds: Int
    
    init(_ seconds: Int) {
        self.seconds = seconds
    }

    func calculateAge(_ orbit: OrbitalDifference) -> Float {
        let orbitSecondsInYear = SpaceAge.secondsInEarthYear * orbit.rawValue
        let value = String(format: "%.02f", (Float(seconds) / orbitSecondsInYear))
        return Float(value)!
    }
    
    var onEarth: Float {
        return calculateAge(.earth)
    }
    
    var onMercury: Float {
        return calculateAge(.mercury)
    }
    
    var onVenus: Float {
        return calculateAge(.venus)
    }
    
    var onMars: Float {
        return calculateAge(.mars)
    }
    
    var onJupiter: Float {
        return calculateAge(.jupiter)
    }
    
    var onSaturn: Float {
        return calculateAge(.saturn)
    }
    
    var onUranus: Float {
        return calculateAge(.uranus)
    }
    
    var onNeptune: Float {
        return calculateAge(.neptune)
    }
}
