//
//  main.swift
//  ErrorHandling
//
//  Created by Mars on 3/9/16.
//  Copyright (c) 2016 Boxue. All rights reserved.
//

import Foundation

// Only optional can be set to nil
// Swithch ... case must be exhausitive

// How to define an Error
// Any type conform to ErrorType protocol

enum RobotError: ErrorType {
    case LowPower(Double) // The minimum power requirement to do anything
    case Overload(Double) // The maximum weight the robot can work with
}

enum Command {
    case PowerUp
    case Lifting(Double)
    case Shutdown
}

class Robot {
    var power = 1.0 // Default to fully charged
    let maxLifting = 100.0 // Max lifting weight of Robot

    // Accept a command
    func action(command: Command) throws {
        switch command {
            case .PowerUp:
                // self.power > 0.2
                guard self.power > 0.2 else {
                    throw RobotError.LowPower(0.2)
                }

                print("Robot started")
            case let .Lifting(weight):
                // weight < self.maxLifting
                guard weight < self.maxLifting else {
                    throw RobotError.Overload(self.maxLifting)
                }

                print("Lifting weight: \(weight) KG")
            case .Shutdown:
                print("Robot is shutting down...")
        }
    }
}

func working(robot: Robot) throws -> Int {
    defer {
        // Executed when leaving the code block of working
        // Put clean up code here
        // break, return or throw is not allowed here
        try! robot.action(Command.Shutdown) // Never throw an exception in the call
    }
    do {
        try robot.action(Command.PowerUp)
        try robot.action(Command.Lifting(152))
    }
    catch let RobotError.LowPower(percentage) {
        print("Low power: \(percentage)")
    }
    catch let RobotError.Overload(maxWeight) {
        print("Overloading... \(maxWeight) KG is allowed")
    }

    return 0
}

let iRobot = Robot()
let a = try? working(iRobot) // Convert errors to optionals
print("value: \(a)\n type: \(a.dynamicType)")














