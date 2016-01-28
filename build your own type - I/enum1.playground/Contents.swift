//: Playground - noun: a place where people can play

import UIKit

let EAST  = 1
let SOUTH = 2
let WEST  = 3
let NORTH = 4

let months = ["January", "February", "March", "April", "May", "June",
    "July", "August", "September", "October", "November", "December"]


// 5 JAN

//: #### Enum

enum Direction: Int {
    case EAST = 2
    case SOUTH = 4
    case WEST = 6
    case NORTH = 8
}

enum Month: Int {
    case January = 1, Februray, March, April, May, June, July,
    August, September, October, November, December
}

let N = Direction.NORTH.rawValue
let S = Direction(rawValue: 4) // Fialable initializer 
S.dynamicType
let JAN = Month.January

//: #### Enum value

func direction(val: Direction) -> String {
    switch val {
    case .NORTH, .SOUTH:
        return "up down"
    case .EAST, .WEST:
        return "left right"
    }
}

//: #### Raw value
//: #### Associated value

enum HTTPAction {
    case GET
    case POST(String)
    case PUT(Int, String)
}

let get = HTTPAction.GET
let post = HTTPAction.POST("BOXUE")
let put = HTTPAction.PUT(1, "Mars")

func actionDesc(action: HTTPAction) {
    switch action {
    case .GET:
        print("HTTP GET")
    case let .POST(msg):
        print("HTTP POST: \(msg)")
    case .PUT(let num, let name):
        print("HTTP PUT: \(num): \(name)")
    }
}

actionDesc(get)
actionDesc(post)
actionDesc(put)

let address: String? = .Some("Beijing")
let address1: Optional<String> = .None




















