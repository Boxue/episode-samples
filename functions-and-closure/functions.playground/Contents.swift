//: Playground - noun: a place where people can play

import UIKit

//: ### Function

//: #### The most simple function

//
func printName() {
    print("My name is Mars.")
}

printName()

//: #### Funtion param
// name: Type
func multipleOfTen(multiplier: Int) {
    print("\(multiplier)  * 10 = \(multiplier * 10)")
}

multipleOfTen(10)

func multipleOf(multiplier: Int, _ andValue: Int) {
    print("\(multiplier) * \(andValue) = \(multiplier * andValue)")
}

multipleOf(5, 10)

//: param name
// innername
func createTable(rowNumber row: Int = 10, colNumer column: Int = 10) {
    print("Table: \(row) x \(column)")
}

createTable(rowNumber: 10, colNumer: 10)

//: Default value

createTable()

//: Variadic param

func arraySum(number: Double...) {
    // number: [Double]
    var sum: Double = 0.0
    
    for i in number {
        sum += i
    }
    
    print("sum: \(sum)")
}

arraySum(1, 2, 3, 4, 5, 6)
arraySum(1, 2, 3, 4)

//: Constant and variable param

func increment(inout value: Int) {
    value++
}

var m = 10
increment(&m)
m

//: inout param

//: http://github.com/boxue