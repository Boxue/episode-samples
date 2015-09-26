//: Playground - noun: a place where people can play

import UIKit

//: ### Basic operators

//: #### Basic assignment
let a = 20
var b = 10

//: #### Basic arithmetic operation

let sum = a + b
let sub = a - b
let mul = a * b
let div = a / b
let mod = a % b

let mod1 = 8 % 2

/*
+---+---+---+---+
| 2 | 2 | 2 | 2 |
+---+---+---+---+
|       8       |
+---+---+---+---+
*/

let mod2 = 8 % 2.5

/*
+-----+-----+-----+-----+
| 2.5 | 2.5 | 2.5 | 0.5 |
+-----+-----+-----+-----+
|       7.5       | 0.5 |
+-----+-----+-----+-----+
|           8           |
+-----+-----+-----+-----+
*/

//: #### Compound assignment

b += 10 // b = b + 10
b -= 10 // b = b - 10
b *= 10 // b = b * 10
b /= 10 // b = b / 10
b %= 10 // b = b % 10

//if b = 10 {
//
//}

//: #### Self increment and decrement
var ppb = ++b
var bpp = b++

--b
b--

//: #### Comparison

let isEqual     = sum == 10
let isNotEqual  = sum != 10
let isGreater   = sum >  10
let isLess      = sum <  10
let isGe        = sum >= 10
let isLe        = sum <= 10

//: Identity operator

//===
//!==

//: ### Tenary Conditional Operator

/*
* if condition {
*     expression1
* }
* else {
*     expression2
* }
*
*/

let isSumEqualToTen = isEqual ? "Yes" : "No"

//: #### Nil Coalescing Operator

// opt != nil ? opt! : b

var userInput: String? = "A user input"

let value = userInput ?? "A default input"

//: #### Range Operator

//: Closed range operator

// begin...end

for index in 1...5 {
    print(index)
}


//: Half-open range operator

// begin..<end [begin, end)

for index in 1..<5 {
    print(index)
}

//: #### Logic operator

let logicalNot = !isEqual
let logicalAnd = isNotEqual && isLess
let logicalOR  = isGreater  || (isLess && isLe)


//: https://github.com/boxue