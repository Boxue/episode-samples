//: Playground - noun: a place where people can play

import UIKit

struct Point {
    var x = 100.0
    var y = 100.0
}

class PointRef {
    // Stored properties
    var x: Int = 100
    var y: Int = 100
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
}

let pt = PointRef(x: 10, y: 10)
pt.x
pt.x = 100
enum Direction: Int {
    case EAST = 2
    case SOUTH = 4
    case WEST = 6
    case NORTH = 8
}

//: #### Computed property

struct MyRect {
    var origin: Point
    // Property observer
    var width: Double {
        willSet(newWidth) {
//            newWidth = abs(newWidth)
            print("width will be updated")
        }
        didSet(oldValue) {
            if width <= 0 {
                width = oldValue
            }
            else {
                self.height = width
            }
        }
    }
    var height: Double
    
    var center: Point {
        get {
            let centerX = origin.x + self.width / 2
            let centerY = origin.y + self.height / 2
            
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) {
            self.origin.x = newCenter.x - self.width / 2
            self.origin.y = newCenter.y - self.height / 2
        }
    }
}



let pt11 = Point(x: 1, y: 1)
var rect1 = MyRect(origin: pt11, width: 200, height: 100)

rect1.width = -300
rect1.height
rect1.width = 300
rect1.height

rect1.width = 300
rect1.width
rect1.height
rect1.center
rect1.height = 200
rect1.origin
var o1 = rect1.center
o1.x += 100
rect1.center = o1
rect1.origin

// Lazy property

class Account {
    let name: String
    lazy var greeting: String = { [unowned self] in
        print("greeting is initialized.")
        return "Hello " + self.name }()
    
    init(name: String) {
        self.name = name
    }
}

let mars = Account(name: "Mars")
// greeting nil
mars.greeting
mars.greeting
mars.greeting













