//: Playground - noun: a place where people can play

import UIKit

//: ### Build your own type

//: Int String

/*
location (Double, Double)
name (String, String)
*/

//: named types

//: struct class enum protocol

//: #### struct - value type

let centerX = 100.0
let centerY = 100.0
let distance = 200.0

func inRange(x: Double, y: Double) -> Bool {
    // sqrt(n) pow(x, n)
    let distX = x - centerX
    let distY = y - centerY
    
    let dist = sqrt(pow(distX, 2) + pow(distY, 2))
    
    return dist < distance
}

inRange(100, y: 500)
inRange(300, y: 800)

// inRange(location1)
// inRange(myHome)

//: #### Define and init struct

struct Location {
    var x = 100.0
    var y = 100.0
    
    // Initializer
    init() {}
    
    init(stringPoint: String) {
        // "100,200"
        let xy = stringPoint.characters.split(",")
        // xy: [[Character], [Character]]
        x = atof(String(xy.first!))
        y = atof(String(xy.last!))
    }
    
    init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }
    
    mutating func moveHorizental(dist: Double) {
        self.x += dist
    }
}

var pointA = Location(x: 100, y: 200) // Memberwiase initialization
var pointB = Location(stringPoint: "100, 200")
var center = Location()

pointA.x
pointA.y = 500.0

func inPointRange(point: Location) -> Bool {
    // sqrt(n) pow(x, n)
    let distX = point.x - centerX
    let distY = point.y - centerY
    
    let dist = sqrt(pow(distX, 2) + pow(distY, 2))
    
    return dist < distance
}

inPointRange(pointA)

//: #### Methods in struct

func moveHorizental(dist: Double, inout point: Location) {
    point.x += dist
}

moveHorizental(100, point: &pointA)
pointA

pointA.moveHorizental(100.0)

//: #### Struct extentions

extension Location {
    mutating func moveVertical(dist: Double) {
        self.y += dist
    }
}

pointA.moveVertical(100)

// String
extension String {
    func isEven() -> Bool {
        return self.characters.count % 2 == 0 ? true : false
    }
}

"An even string".isEven()

//: #### Struct is a value type

var copyPointA = pointA
copyPointA.y = 10000.0
pointA

//: https://boxueio.com
