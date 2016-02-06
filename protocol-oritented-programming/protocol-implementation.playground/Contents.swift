//: Playground - noun: a place where people can play

import UIKit

//: #### protocol

protocol Engine {
    var cylinder: Int { get set }
    var capacity: Double { get }
    func start()
    func stop()
    func getName(prefix: String)
    func getName()
}

protocol TurboEngine: Engine {
    func startTurbo()
    func stopTurbo()
}

protocol Motor {
    var power: Double { get set }
}
class V8 : TurboEngine, Motor {
    var cylinder = 8
    var power = 300.0
    private var innerCapacity = 4.0
    var capacity: Double {
        get {
            return self.innerCapacity
        }
        set {
            self.innerCapacity = newValue
        }
    }
    // Engine methods
    func start() { print("Engine started") }
    func stop() { print("Engine stopped") }
    func getName(prefix: String) {
        print("\(prefix)-V8-ENGINE")
    }
    
    func getName() {
        print("V8-ENGINE")
    }
    
    // TurboEngine methods
    func startTurbo() { print("Turbo started") }
    func stopTurbo() { print("Turbo stopped") }
}

let v8L40 = V8()
v8L40.cylinder
v8L40.cylinder = 8
//(v8L40 as Engine).capacity = 4.0















