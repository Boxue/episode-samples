//: Playground - noun: a place where people can play

import UIKit

/*:
### Tuple - Pack multiple values together
+ (200, "HTTP OK")
+ (404, "File not found")
+ ("Mars", 11, "11@boxue.io")
*/

//: #### Define a tuple

let success = (200, "HTTP OK")
let fileNotFound = (404, "File not found")

let me = (name: "Mars", no: 11, email: "11@boxue.io")

//: #### Access tuple content

success.0
success.1

fileNotFound.0
fileNotFound.1

me.name
me.no
me.email

//: Tuple decomposition

var (successCode, successMessage) = success

print(successCode)
print(successMessage)

successCode = 201

success

let (_, errorMessage) = fileNotFound

print(errorMessage)

//: Type

/*
success - (Int, String)
me - (String, Int, String)
*/


//: https://github.com/boxue
