//: Playground - noun: a place where people can play

import UIKit

//: #### functional programming

// filter in array

var numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9]

var evens = [Int]()

for n in numbers {
    if n % 2 == 0 {
        evens.append(n)
    }
}

evens

let evens1 = numbers.filter({ $0 % 2 == 0 }) // high order function

evens1

// Mathematical function

// Computational function

// S = V * t
// f(t) = 80 * t

//func distance(t: Double) -> Double {
//    let condition = externalCondition
//    return 80 * t * condition
//}

extension Array {
    func myOwnFilter<T>(predicate:(T) -> Bool) -> [T] {
        var tmp = [T]()
        
        for i in self {
            if predicate(i as! T) {
                tmp.append(i as! T)
            }
        }
        
        return tmp
    }
}

let odds = numbers.myOwnFilter({ $0 % 2 != 0 })
odds

let num = [1, 3, 4, 5, 6, 5.5]

num.myOwnFilter({ $0 % 2.0 == 0 })

