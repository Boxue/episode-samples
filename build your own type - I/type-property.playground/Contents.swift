//: Playground - noun: a place where people can play

import UIKit

struct Point {
    var x = 100.0
    var y = 100.0
}

enum Shape {
    case RECT
    case TRIANGLE
    case CIRCLE
}

struct MyRect {
    static let shape = Shape.RECT
    var origin: Point
    var width: Double
    var height: Double
}

let shape = MyRect.shape