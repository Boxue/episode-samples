//: Playground - noun: a place where people can play

import UIKit

//: #### ARC - automatic reference counting 

class Person {
    let name: String
    var apartment: Apartment?
    
    init(name: String) {
        self.name = name
        print("\(name) is being initialized.")
    }
    
    deinit {
        print("\(name) is being deinitialized.")
    }
}

class Apartment {
    let unit: String
    var tenant: Person?
    
    init(unit: String) {
        self.unit = unit
        print("Apartment \(unit) is being initialized.")
    }
    
    deinit {
        print("Apartment \(unit) is being deinitialized.")
    }
}

//: Strong reference
//var ref1: Person?
//var ref2: Person?
//
//ref1 = Person(name: "Mars")
//ref2 = ref1
//
//ref1 = nil
//ref2 = nil

var mars: Person? = Person(name: "Mars")
var apt11: Apartment? = Apartment(unit: "11")

mars!.apartment = apt11
apt11!.tenant = mars

mars = nil
apt11 = nil























