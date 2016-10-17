import Foundation

struct Raindrops {
    
    let raindrops: Int
    let soundMap = [ 3 : "Pling", 5 : "Plang", 7 : "Plong" ]
    
    var sounds: String {
        let uniquePrimes = Set(PrimeFactors(raindrops).toArray)
        
        let sounds = uniquePrimes
            .sort()
            .reduce("") { (sounds, prime) in
                if soundMap.keys.contains(prime) {
                    return sounds + soundMap[prime]!
                }
                return sounds
            }
        
        return sounds.isEmpty ? "\(raindrops)" : sounds
    }
    
    init (_ raindrops: Int) {
        self.raindrops = raindrops
    }
}