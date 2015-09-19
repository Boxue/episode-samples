//: Playground - noun: a place where people can play

import UIKit

/*:
### Numbers in Swift

+ Integer Such as: 1 10 100 1000
+ Float   Such as: 3.14 1.44 2.71
*/

//: ### Integer

/*
(U)Int (8 / 16 / 32 / 64)
*/

/*
Integer types:

+-------+--------+--------+--------+
|  Int8 |  Int16 |  Int32 |  Int64 | Int - preferred
+-------+--------+--------+--------+
| UInt8 | UInt16 | UInt32 | UInt64 | UInt
+-------+--------+--------+--------+
*/

Int.min
Int.max

Int64.min
Int64.max

//: Number literal

let fifteenInDecimal = 15
let fifteenInHex = 0xF
let fifteenInOctal = 0o17
let fifteenInBinary = 0b1111

//: ### Float numbers

/*:
+ Float  - a 6 digits precision number
+ Double - a 15 digits precision number
*/

var oneThirdInFloat: Float = 1/3
var oneThirdInDouble: Double = 1/3

print(oneThirdInFloat)
print(oneThirdInDouble)

var PI = 0.314e1
PI = 314e-2

//: Number Type inference

var three = 3
three.dynamicType

var zeroPointForteen = 0.14
zeroPointForteen.dynamicType

PI = 3 + 0.14
PI.dynamicType

PI = Double(three) + zeroPointForteen

//: https://github.com/boxue