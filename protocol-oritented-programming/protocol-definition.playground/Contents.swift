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

//let v8: TurboEngine
//let truck = Engine()
//class Truck: Engine {}
