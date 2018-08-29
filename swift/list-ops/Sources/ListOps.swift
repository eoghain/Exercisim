struct ListOps<T> {
    
    static func append(_ list: [T], _ append: [T]) -> [T] {
        return list + append
    }
    
    static func concat(_ lists: [T]...) -> [T] {
        var final = [T]()
        for list in lists {
            final += list
        }
        return final
    }
    
    static func filter(_ list: [T], test: (T)->(Bool) ) -> [T] {
        var filtered = [T]()
        
        for item in list {
            if test(item) {
                filtered = ListOps.append(filtered, [item])
            }
        }
        
        return filtered
    }
    
    static func length(_ list: [T]) -> Int {
        return list.count
    }
    
    static func map(_ list: [T], map: (T)->(T))  -> [T] {
        var mapped = [T]()
        
        for item in list {
            mapped = ListOps.append(mapped, [map(item)])
        }
        
        return mapped
    }
    
    static func foldLeft(_ list: [T], accumulated: T, combine: (T,T) -> T) -> T {
        var accumulated = accumulated
        
        for item in list {
            accumulated = combine(accumulated, item)
        }
        
        return accumulated
    }
    
    static func foldRight(_ list: [T], accumulated: T, combine: (T,T) -> T) -> T {
        var accumulated = accumulated
        
        for item in ListOps.reverse(list) {
            accumulated = combine(item, accumulated)
        }
        
        return accumulated
    }
    
    static func reverse(_ list: [T]) -> [T] {
        var reversed = [T]()
        
        for item in list {
            reversed = ListOps.append([item], reversed)
        }
        
        return reversed
    }
}
