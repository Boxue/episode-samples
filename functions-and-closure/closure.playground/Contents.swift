//: Playground - noun: a place where people can play

import UIKit

//: ### Closures

let ten = 10

var addClosure: (Int, Int) -> Int =
{ (a: Int, b: Int) -> Int in
    return a + b
}

addClosure(5, 10)

addClosure = { a, b in return a + b }

addClosure = { a, b in a + b } // Single expression closure

// $0, 1, 2, 3

addClosure = { $0 + $1 }

func execute(a: Int, _ b: Int, operation: (Int, Int) -> Int) -> Int {
    return operation(a, b)
}

func addFunc(a: Int, _ b: Int) -> Int {
    return a + b
}

execute(1, 10, operation: addFunc)
execute(1, 10, operation: addClosure)

execute(1, 10, operation: { (a: Int, b: Int) -> Int in
    return a + b
})

execute(1, 10, operation: { a, b in a + b })
execute(1, 10, operation: { $0 + $1 })
execute(1, 10) { $0 + $1 } // Trailing Closure

// Void

let voidClosure: () -> Void = { print("Swift is fun") }

//: Capturing value

// Scope

// Global

// if {} while {} func { new scope }

var count = 0

let increment = { ++count }

increment()
increment()
increment()
increment()
increment()

count

func counting() -> () -> Int {
    var count = 0
    let incrementCount: () -> Int = { ++count }
    
    return incrementCount
}

let c1 = counting()
c1()
c1()

let c2 = counting()

c2()
c2()
c2()

//: https://boxueio.com
































