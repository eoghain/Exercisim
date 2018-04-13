import Foundation

struct Sieve {

    let nums: [Int]
    
    var primes: [Int] {
        var primes = nums
        
        nums.forEach{ num in
            primes = primes.filter{ $0 <= num || $0 % num != 0 }
        }
        
        return primes
    }
    
    init (_ num: Int) {
        nums = [Int](2...num)
    }
}