import Foundation

enum OrbitalDifference: Float {
    case
        Earth   = 1,
        Mercury = 0.2408467,
        Venus   = 0.61519726,
        Mars    = 1.8808158,
        Jupiter = 11.862615,
        Saturn  = 29.447498,
        Uranus  = 84.016846,
        Neptune = 164.79132
}

struct SpaceAge {
    
    static let secondsInEarthYear: Float = 31557600
    let seconds: Int
    
    init(_ seconds: Int) {
        self.seconds = seconds
    }

    func calculateAge(orbit: OrbitalDifference) -> Float {
        let orbitSecondsInYear = SpaceAge.secondsInEarthYear * orbit.rawValue
        let value = String(format: "%.02f", (Float(seconds) / orbitSecondsInYear))
        return Float(value)!
    }
    
    var onEarth: Float {
        return calculateAge(.Earth)
    }
    
    var onMercury: Float {
        return calculateAge(.Mercury)
    }
    
    var onVenus: Float {
        return calculateAge(.Venus)
    }
    
    var onMars: Float {
        return calculateAge(.Mars)
    }
    
    var onJupiter: Float {
        return calculateAge(.Jupiter)
    }
    
    var onSaturn: Float {
        return calculateAge(.Saturn)
    }
    
    var onUranus: Float {
        return calculateAge(.Uranus)
    }
    
    var onNeptune: Float {
        return calculateAge(.Neptune)
    }
}
