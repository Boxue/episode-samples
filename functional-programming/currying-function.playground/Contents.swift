//: Playground - noun: a place where people can play

import UIKit

//: #### Currying Function

// Partial Application
let info = "Name:Mars,Email:11@boxue.io,No:11"
print(info.componentsSeparatedByString(","))

typealias splitter = (String) -> [String]

func createSplitter(separator: String) -> splitter {
    func split(source: String) -> [String] {
        return source.componentsSeparatedByString(separator)
    }
    
    return split
}

var commaSplitter = createSplitter(",")
print(commaSplitter(info))

var colonSplitter = createSplitter(":")
print(colonSplitter(info))

func curryingSplitter(separator: String)(source: String) -> [String] {
    return source.componentsSeparatedByString(separator)
}

commaSplitter = curryingSplitter(",")
print(commaSplitter(info))

func curryingAddNumbers(one: Int)(two: Int)(three: Int) -> Int {
    return one + two + three
}

let bindOne = curryingAddNumbers(1)
let bindTwo = bindOne(two: 2)
let addThree = bindTwo(three: 3)

















