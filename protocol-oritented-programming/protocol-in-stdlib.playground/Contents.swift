//: Playground - noun: a place where people can play

import UIKit

//: #### Equatable and Comparable

let a: Int = 10
let b: Int = 10

let d1: Double = 3.14
let d2: Double = 3.14

struct Rational {
    var numerator: Int = 0
    var denominator: Int = 1
}

let oneHalf = Rational(numerator: 1, denominator: 2)
let zeroPointTwo = Rational(numerator: 1, denominator: 2)

// Equatable
extension Rational: Comparable {}

func < (lhs: Rational, rhs: Rational) -> Bool {
    let lQuotient = Double(lhs.numerator) / Double(lhs.denominator)
    let rQuotient = Double(rhs.numerator) / Double(rhs.denominator)
    
    return lQuotient < rQuotient
}

func == (lhs: Rational, rhs: Rational) -> Bool {
    return (lhs.numerator == rhs.numerator) && (lhs.denominator == rhs.denominator)
}

if oneHalf != zeroPointTwo {}

// Comparable <, <=, >, >=

var rationalArray: Array<Rational> = []

for i in 1...10 {
    let r = Rational(numerator: i, denominator: i+1)
    rationalArray.append(r)
}

print("Max: \(rationalArray.maxElement())")
print("Min: \(rationalArray.minElement())")
rationalArray.sort()
rationalArray.contains(oneHalf)
rationalArray.startsWith([oneHalf])

// CustomStringConvertible
extension Rational: CustomStringConvertible {
    var description: String {
       return "\(self.numerator) / \(self.denominator)"
    }
}

// BooleanType
extension Rational: BooleanType {
    var boolValue: Bool {
        return self.numerator != 0
    }
}

if oneHalf {
    print("oneHalf means true")
}

// Hashable
extension Rational: Hashable {
    var hashValue: Int {
        let v = Int(String(self.numerator) + String(self.denominator))
        return v!
    }
}

oneHalf.hashValue

var rDict: Dictionary<Rational, String> = [oneHalf: "0.5"]
var rSet: Set<Rational> = [oneHalf]









