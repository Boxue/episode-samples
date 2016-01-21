//: Playground - noun: a place where people can play

import UIKit

class Point2D {
    var x: Double
    var y: Double
    
    init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }
    
    convenience init(pt: (Double, Double)) {
        self.init(x: pt.0, y: pt.1)
    }
    
    convenience init?(strPt: (String, String)) {
        let x = Double(strPt.0)
        let y = Double(strPt.1)
        
        if x == nil || y == nil {
            return nil
        }
        
        self.init(pt: (x!, y!))
    }
    
    convenience init(val: Double) {
        self.init(x: val, y: val)
    }
}

class Point3D : Point2D {
    var z = 0.0
    
    init(x: Double, y: Double, z: Double) {
        self.z = z
        super.init(x: x, y: y)
        round(self.x)
        round(self.y)
        round(self.z)
    }
    
    override init(x: Double, y: Double) {
        super.init(x: x, y: y)
    }
    
    convenience init(val: Double) {
        self.init(x: val, y: val, z: val)
    }
}

let origin3D = Point3D(x: 0, y: 0)
let point3D11 = Point3D(pt: (1.0, 1.0))
let point3D22 = Point3D(strPt: ("2.0", "2.0"))
let point3D33 = Point3D(val: 3.0)

// Two-phase initialization

























