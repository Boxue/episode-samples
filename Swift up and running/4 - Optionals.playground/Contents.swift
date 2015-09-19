//: Playground - noun: a place where people can play

import UIKit

/*:
### Optional

+ There's a value _x_

_or_

+ There's nothing at all
*/

//: OC - nil, NSNotFound, -1 0 ""
//: Swift - optional

//: ####Define an optional variable

//: String -> Int

let possibleNumber = "123"
var convertResult = Int(possibleNumber)

print(convertResult)

convertResult.dynamicType

var x: Int?
var address: String?
var successRate: Double?

//convertResult = nil

var m = 10

//m = nil

//: #### Access optional

if convertResult != nil {
    // Force unwrapping
    print(convertResult!)
    let sum = convertResult! + 1
    
}


//print(x!)

//: Optional binding

if var number = convertResult {
    let sum = number + 1
    number++
    print(number)
    print(convertResult)
}
else {
    print("Convert result is nil")
}

//: #### Implicitly Unwrapped Optionals

var possibleString: String! = "A dangerous way!"

print(possibleString)

possibleString + " Use it with caution!"

//: https://github.com/boxue