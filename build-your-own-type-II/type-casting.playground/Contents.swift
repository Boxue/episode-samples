//: Playground - noun: a place where people can play

import UIKit

//: #### is as as? as!

protocol Shape {}
class Rectangle: Shape {}
class Circle: Shape {}

let r = Rectangle()
let c = Circle()
let shapeArray: Array<Shape> = [ r, c ]
shapeArray.dynamicType

var totalRects: Int = 0
var totalCircles: Int = 0

for s in shapeArray {
    if s is Rectangle {
        totalRects++
    }
    else if s is Circle {
        totalCircles++
    }
}

totalRects
totalCircles

// as? as!
(shapeArray[0] as? Rectangle).dynamicType
(shapeArray[0] as! Rectangle).dynamicType
//(r as! Double).dynamicType

// AnyObject

let box: Array<Any> = [
    3,
    3.14,
    "3.14",
    r,
    { return "I'm a closure" }
]

for item in box {
    switch item {
    case is Int:
        print("\(item) is Int")
    case is Double:
        print("\(item) is Double")
    case is String:
        print("\(item) is String")
    case let rect as Rectangle:
        print("\(item) is Rectangle")
    case let fn as ()->String:
        fn()
    default:
        print("Out of box")
    }
}

box[0] is Shape
(box[3] as? Shape).dynamicType
(box[3] as! Shape).dynamicType
//(box[2] as! Shape).dynamicType




















