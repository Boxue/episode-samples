//
//  main.swift
//  ResultErrorHandling
//
//  Created by Mars on 3/11/16.
//  Copyright (c) 2016 Boxue. All rights reserved.
//

import Foundation

func divide(dividend: Double, by: Double, inout err: String?) -> Double {
    if by == 0 {
        err = "Cannot divide by zero"
        return -1 // A trival return
    }
    else {
        return dividend / by
    }
}

var err: String?
var result = divide(4, by: 2, err: &err) // inout parameter is machine oriented

if let err = err { // The caller decide wehther or how to handle the error
    print("\(err)")
}
else {
    print("\(result)")
}

enum Result<T> {
    case Success(T)
    case Failure(String)

    func map<P> (f: T -> P) -> Result<P> {
        switch self {
        case .Success(let value):
            return .Success(f(value))
        case .Failure(let err):
            return .Failure(err)
        }
    }

    func flatMap<P> (f: T -> Result<P>) -> Result<P> {
        switch self {
        case .Success(let value):
            return f(value) // do not need to wrap in .Success
        case .Failure(let err):
            return .Failure(err)
        }
    }
}

func newDivide(dividend: Double, by: Double) -> Result<Double> {
    if by == 0 {
        return Result.Failure("Cannot divide by zero")
    }
    else {
        return Result.Success(dividend / by)
    }
}

let r = newDivide(4, by: 0)

switch r {
case .Success(let value):
    print("\(value)")
case .Failure(let err):
    print("\(err)")
}

func numberSqrt(num: Result<Double>) -> Result<Double> {
    switch num {
    case .Success(let num):
        return Result.Success(sqrt(num))
    case .Failure(let err):
        return Result.Failure(err)
    }
}

let r1 = numberSqrt(r)
print("\(r1)")

func number2String(num: Result<Double>) -> Result<String> {
    switch num {
    case .Success(let num):
        let s = String(format: "%.10f", num)
        return Result.Success(s)
    case .Failure(let err):
        return Result.Failure(err)
    }
}

let r2 = number2String(r1)
print("\(r2)")

func numSqrt(num: Double) -> Result<Double> {
    if (num < 0) {
        return .Failure("num cannot be negative")
    }
    else {
        return .Success(sqrt(num))
    }
}

func num2String(num: Double) -> String {
    let s = String(format: "%.10f", num)
    return s
}

// map Result<Result<Double>>
let r3 = r.flatMap(numSqrt).map(num2String)
print("\(r3)")

let r4 = r.map(sqrt).map({ String(format: "%.10f", $0) })
print("\(r4)")
