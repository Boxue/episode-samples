//: Playground - noun: a place where people can play

import UIKit

class Point2D {
    var x: Double
    var y: Double
    
    // Designated Initializer or memberwise initializer
    init?(x: Double, y: Double) {
//        if x < 0 || y < 0 {
//            return nil
//        }
        self.x = x
        self.y = y
        
    }
    // Convenience initializer
    convenience init(xy: (Double, Double)) {
        self.init(x: xy.0, y: xy.1)!
    }
    
    convenience init(val: Double) {
        self.init(x: val, y: val)!
    }
    // Failable initializer
    convenience init?(xyStr: (String, String)) {
        let x = Double(xyStr.0)// Double?
        let y = Double(xyStr.1)
        
        if x == nil || y == nil {
            return nil
        }
        
        self.init(xy: (x!, y!))
    }
}

//: #### Default init
//let origin = Point2D()

let pt11 = Point2D(x: 1.0, y: 1.0)
let pt22 = Point2D(xy: (2.0, 2.0))
// y = x
let pt33 = Point2D(val: 3.0)
let pt44 = Point2D(xyStr: ("Four", "4.0"))
pt44.dynamicType

















