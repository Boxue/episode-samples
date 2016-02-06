import Foundation

struct Point {
    var x = 100.0
    var y = 100.0
}

enum Shape {
    case RECT
    case TRIANGLE
    case CIRCLE
}

public class MyRect {
    static let shape = Shape.RECT
    public static var singleRect = MyRect()
    var origin: Point = Point(x: 0, y: 0)
    var width: Double = 100
    var height: Double = 100
    
    private init() {}
}