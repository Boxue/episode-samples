//: Playground - noun: a place where people can play

import UIKit

class Flight {
    var delay: Int
    var normal: Int
    var flyHour: Int
    
    init(d: Int, n: Int, f: Int) {
        self.delay = d
        self.normal = n
        self.flyHour = f
    }
    
    func delayRate() -> Double {
        return Double(delay) / Double(delay + normal)
    }
}

class CancellableFlight: Flight {
    var cancel: Int
    
    init(d: Int, n: Int, f: Int, c: Int) {
        self.cancel = c
        super.init(d: d, n: n, f: f)
    }
    
    override func delayRate() -> Double {
        return Double(delay + cancel) / Double(delay + normal + cancel)
    }
}
// TwoLayerFourEngineRoundTripCancellableFlight
class A330: Flight {}
class A380: CancellableFlight {
}

















