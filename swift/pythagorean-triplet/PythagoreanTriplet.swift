import Foundation

struct Triplet {
    
    let sum: Int
    let product: Int
    let isPythagorean: Bool

    static func Where(_ min: Int = 1, maxFactor max: Int = 0, sum: Int? = nil) -> [Triplet] {
        return
            (min...max).flatMap { (a: Int) in
                (a...max).flatMap { (b: Int) in
                    (b...max).flatMap { (c: Int) in
                        let triplet = Triplet(a,b,c)
                        if triplet.isPythagorean && (sum == nil || triplet.sum == sum!) {
                            return triplet
                        }
                        return nil
                    }
                }
            }
    }
    
    init (_ a: Int, _ b: Int, _ c: Int) {
        self.sum = a+b+c
        self.product = a*b*c
        self.isPythagorean = a * a + b * b == c * c
    }
}
