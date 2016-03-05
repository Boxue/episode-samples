//: Playground - noun: a place where people can play

import UIKit

enum RobotError: ErrorType {
    case LowPower(Double)
    case Overload(Double)
}

enum Command {
    case PowerUp
    case Lifting(Double)
    case Shutdown
}
UITableViewController
class Robot {
    var power = 1.0
    let maxLifting = 100.0 // Kg
    
    func action(command: Command) throws {
        switch command {
        case .PowerUp:
            guard self.power > 0.2 else {
                throw RobotError.LowPower(0.2)
            }
            
            print("Robot started")
        case let .Lifting(weight):
            guard weight <= maxLifting else {
                throw RobotError.Overload(maxLifting)
            }
            
            print("Lifting weight: \(weight) KG")
        case .Shutdown:
            print("Robot shuting down...")
        }
    }
}

let iRobot = Robot()

func working(robot: Robot) throws {
    defer {
        try! iRobot.action(Command.Shutdown)
    }
    
    do {
        try robot.action(Command.PowerUp)
        try robot.action(Command.Lifting(52))
    }
    catch let RobotError.LowPower(percentage) {
        print("Low power: \(percentage)")
    }
    catch let RobotError.Overload(maxWeight) {
        print("Overloading, max \(maxWeight) KG is allowd")
    }
}

try? working(iRobot)
