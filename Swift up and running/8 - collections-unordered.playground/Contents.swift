//: Playground - noun: a place where people can play

import UIKit

//: #### Set

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

//: Initialization
// Hashable

let number = 10
number.hashValue

let PI = 3.14
PI.hashValue

let string = "Swift"
string.hashValue

let emptySet = Set<Character>()

// ["a", "e", "i", "o", "u"]

let vowel: Set<Character> = ["a", "e", "i", "o", "u"]
var evenSet: Set = [2, 4, 6, 8, 10]

//: Access and modifying a set

vowel.count

emptySet.isEmpty

evenSet.insert(12)

evenSet.remove(12)

evenSet.remove(14)

//evenSet.removeAll()

evenSet.contains(10)

//: Iterating over a set

for number in evenSet {
    print(number)
}

for number in evenSet.sort() {
    print(number)
}

//: Set operation

var setA: Set = [1, 2, 3, 4, 5, 6]

var setB: Set = [4, 5, 6, 7, 8, 9]

let interSectAB: Set = setA.intersect(setB)
let exclusiveAB: Set = setA.exclusiveOr(setB)
let unionAB: Set = setA.union(setB)
let aSubstractB: Set = setA.subtract(setB)

//: Set membership and Equality

var setC: Set = [1, 2, 3]

if setA == setB {
}
else {
    print("They are not equal")
}

setA.isSupersetOf(setC)

setC.isSubsetOf(setA)

setA.isStrictSupersetOf(setC)
setC.isStrictSubsetOf(setA)

setB.isDisjointWith(setC)

//: #### Dictionary

//: Init a dictionary

var int2String = [Int: String]()

int2String[10] = "Ten"
int2String[20] = "Twenty"

int2String = [:]

var capitalNumber = [
    1 : "壹",
    2 : "贰",
    3 : "叁",
    4 : "肆",
    5 : "伍",
    6 : "陆",
    7 : "柒",
    8 : "捌",
    9 : "玖",
    10 : "拾"
]

capitalNumber[1]
capitalNumber[10]

//: Access and modify a dictionary

capitalNumber.count

capitalNumber.isEmpty

capitalNumber[1] = "一"

capitalNumber.updateValue("壹", forKey: 1)

capitalNumber[10] = nil
capitalNumber

var optionalNine = capitalNumber.removeValueForKey(9)
optionalNine.dynamicType


capitalNumber

// String?

//: Iterating over a dictionary

// for in

for (key, value) in capitalNumber {
    print("\(key): \(value)")
}

for number in capitalNumber.keys.sort() {
    number
}

capitalNumber.keys

let keyArray = [Int](capitalNumber.keys)

let valueArray = [String](capitalNumber.values)

//: https://github.com/boxue

