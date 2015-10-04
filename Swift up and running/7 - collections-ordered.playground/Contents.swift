//: Playground - noun: a place where people can play

import UIKit

//: ### Collections

//: Ordered collection
//: Unordered collection

/*
let boxue = ["B", "o", "x", "u", "e"]

idx val
+---+---+
| 0 | B |
+---+---+
| 1 | o |
+---+---+
| 2 | x |
+---+---+
| 3 | u |
+---+---+
| 4 | e |
+---+---+
*/

/*
Characters box
+------------+
|  A   c     |
|    b      i|
| h       d  |
|   x   q    |
|     z    o |
+------------+
*/

//: #### Array


//: Array  initialization

var array1: Array<Int> = Array<Int>()
var array2: [Int] = array1
var array3 = array2

var threeInts = [Int](count: 3, repeatedValue: 1)
var sixInts = threeInts + threeInts

// [value1, value2, value3, value4]
var fiveInts = [1, 2, 3, 4, 5]

//: Access and Modify an array

// Count
fiveInts.count
array1.count

// Empty
// if array1.count == 0

if array2.isEmpty {
    print("array2 is empty")
}

// Append
array1.append(1)
array2 += [2, 3, 4]

// Indices

array2[2]

array2[0...1]
array2[1...2]
array2[0..<2]

array2[0...1] = [5]
array2

// Insert and remove element at index
array2.insert(6, atIndex: 0)

array2.removeAtIndex(0)
array2

array2.removeLast()

// array2.removeAtIndex(array2.count - 1)

//: iteration

for number in fiveInts {
    print(number)
}

fiveInts.enumerate()
for (index, value) in fiveInts.enumerate() {
    print("Index: \(index) Value: \(value)")
}

//: https://github.com/bouxe
