//: Playground - noun: a place where people can play

import UIKit

//: ### Function

//: #### Return value

func multipleOf(multiplier: Int,
                _ andValue: Int) -> Int {
    return multiplier * andValue
}

var m = multipleOf(5, 10)

func tableInfo() -> (row: Int, column: Int) {
    return (4, 4)
}

var table = tableInfo()
table.row
table.column

func string2Int(str: String) -> Int? {
    return Int(str)
}

var n = string2Int("123")
n.dynamicType

//: #### Function Type

// multipleOf (Int, Int) -> Int
// tableInfo () -> (Int, Int)
// string2Int (String) -> Int?

var f1: (Int, Int) -> Int = multipleOf
var f2 = tableInfo
var f3 = string2Int

f1(5, 10)
f2()
f3("100")

func execute(fn: (String) -> Int?, _ fnParam: String) {
    fn(fnParam)
}

execute(f3, "1000")

typealias op = (Int) -> Int

func whichOne(n: Bool) -> op {
    func increment(n: Int) -> Int {
        return n + 1
    }
    
    func decrement(n: Int) -> Int {
        return n - 1
    }
    
    return n ? increment : decrement
}

var one = 1

var oneToTen = whichOne(one < 10)

while one < 10 {
    one = oneToTen(one)
}

//: Nested function
//: http://github.com/boxue












