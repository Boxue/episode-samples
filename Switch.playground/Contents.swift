//: Playground - noun: a place where people can play

import UIKit

//: ### Switch in Swift

//: Basic usage

let someChar: Character = "a"

switch someChar {
case "a", "e", "i", "o", "u":

print("vowel char \(someChar)")
default:
    print("Character: \(someChar)!")
}

//: Interval 

let number = 10

switch number {
case 1..<10:
    print("Several")
case 10..<100:
    print("Dozens of")
case 100..<1000:
    print("Hundreds of")
default:
    print("Many")
}

//: tuple

let point = (1, 1)

switch point {
case (0, 0):
    print("Point is at the origin")
case (_, 0):
    print("(\(point.0), 0) is on the x-axis")
case (0, _):
    print("(0, \(point.1)) is on the y-axis")
case (-2...2, -2...2):
    print("(\(point.0), \(point.1)) is inside the blue box.")
default:
    print("(\(point.0), \(point.1)) is outside the blue box.")
}

// value binding

switch point {
case (let x, 0):
    print("with the X value of: \(x)")
case (0, let y):
    print("with the Y value of: \(y)")
case (let x, let y):
    print("X: \(x), Y: \(y)")
}

switch point {
case let (x, y) where x == y:
    print("(\(point.0, point.1) is on y = x)")
case let (x, y) where x == -y:
    print("(\(point.0, point.1) is on y = -x)")
case let (x, y):
    print("(\(point.0, point.1))");
}

//: https://github.com/boxue
