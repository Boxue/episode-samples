//
//  main.swift
//  Demo
//
//  Created by Mars on 9/8/15.
//  Copyright (c) 2015 Mars. All rights reserved.
//

import Foundation

/*:
### var - Define a variable
var NAME = VALUE
*/

//: #### Fundamental types

//: Integer
var hours = 24

//: Double
var PI = 3.14

//: Bool
var swiftIsFun = true

//: String
var boxue = "boxue.io"

//: #### Collection types

//: Array, Set, Dictionary

//: #### Swift ONLY Advanced types

//: Tuple - Pack many types of values together
var me = ("Mars", 11, "11@boxue.io")
me.0
me.1

//: Optional - There's a value 'X' or nil
/*
String -> Int
"123" -> 123
"ABC" -> nil
*/

hours = 12

/*:
### let - Define a constant
let NAME = VALUE
*/

let minutes = 30
let fireIsHot = true

//fireIsHot = false

// Type inference

var x: Int
var s: String

// Type annotation

//print(x)

//var m = 0; var n = 0

//: Single line comment

/*:
A multiple line comment
A multiple line comment
A multiple line comment
*/

