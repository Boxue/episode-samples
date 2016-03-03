//: Playground - noun: a place where people can play

import UIKit

//: #### Protocol extension

protocol Flight {
    var delay: Int { get }
    var normal: Int { get }
    var flyHour: Int { get }
    
//    func delayRate() -> Double
}

protocol OperationalLife {
    var maxFlyHours: Int { get }
}

extension Flight where Self: OperationalLife {
    func isInService() -> Bool { return self.flyHour < maxFlyHours }
}
extension Flight {
    var totalTrips: Int { return delay + normal }
    func delayRate() -> Double {
        return Double(delay) / Double(totalTrips)
    }
}

struct A380: Flight {
    var delay: Int
    var normal: Int
    var flyHour: Int
    func delayRate() -> Double {
        return 0.1
    }
}

extension A380: OperationalLife {
    var maxFlyHours: Int { return 18 * 365 * 24 }
}
let flight1 = A380(delay: 300, normal: 700, flyHour: 3 * 365 * 24)
flight1.totalTrips
flight1.delayRate()
(flight1 as Flight).delayRate()
//:#### Type constraints
flight1.isInService()













