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

let v8: TurboEngine
//let truck = Engine()

//class Truck: Engine {}

class V8: TurboEngine {
    var cylinder: Int = 8
    var capacity: Double = 4.0
    
    func start() { print("Engine started") }
    
    func stop() { print("Engine stopped") }
    
    func startTurbo() { print("Turbo started") }
    
    func stopTurbo() { print("Turbo stopped") }

    func getName(prefix: String = "") {
        print("\(prefix)-V8-ENGINE")
    }
    
    func getName() {
        print("V8-ENGINE")
    }
}

let v8L40 = V8()
v8L40.cylinder
v8L40.cylinder = 8
(v8L40 as TurboEngine).capacity = 3.5

let v8L35 = v8L40 as TurboEngine
v8L35.capacity = 3.5

