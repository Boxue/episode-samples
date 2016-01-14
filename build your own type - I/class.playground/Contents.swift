//: Playground - noun: a place where people can play

import UIKit

//123
struct PointVal {
    var x: Int
    var y: Int
    
//    init(x: Int, y: Int) {
//        self.x = x
//        self.y = y
//    }
    mutating func moveX(x: Int) {
        self.x += x
    }
}

class PointRef {
    var x: Int
    var y: Int
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    func moveX(x: Int) {
        self.x += x
    }
}

let p1 = PointVal(x: 0, y: 0)
var p4 = p1

//p1.x = 10

p4.x = 10
p1.x
let p2 = PointRef(x: 0, y: 0)
var p5 = p2
p2 = p5
p2.x = 10
p5.x
let p3 = PointRef(x: 0, y: 0)

//p1.x = 10
p2.x = 10
//p2 = p3

// Identity operator
if p2 === p3  {
    print("They are the same object")
}

if p2 !== p3  {
    print("They are not the same object")
}



















