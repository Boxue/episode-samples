//: Playground - noun: a place where people can play

import UIKit

protocol Flight {
    var delay: Int { get }
    var normal: Int { get }
    var flyHour: Int { get }
    
    func delayRate() -> Double
}

protocol Cancellable {
    var cancel: Int { get }
}

extension Flight {
    func delayRate() -> Double {
        return Double(delay) / Double(delay + normal)
    }
}

extension Flight where Self: Cancellable {
    func delayRate() -> Double {
        return Double(delay + cancel) / Double(delay + normal + cancel)
    }
}
struct A330: Flight {
    var delay: Int
    var normal: Int
    var flyHour: Int
}

struct A380: Flight, Cancellable {
    var delay: Int
    var normal: Int
    var flyHour: Int
    var cancel: Int
}

// TwoLayerFourEngineRoundTripCancellableFlight

/*
struct A380: Flight, TwoLayer, FourEngine, RoundTrip, Cancellable {
}
*/

//Array





