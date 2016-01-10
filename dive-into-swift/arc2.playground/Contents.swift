//: Playground - noun: a place where people can play

import UIKit

//: #### ARC - automatic reference counting 

class Person {
    let name: String
    var apartment: Apartment?
    var property: Apartment?
    
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
    weak var tenant: Person?
    unowned let owner: Person
    
    init(unit: String, owner: Person) {
        self.unit = unit
        self.owner = owner
        print("Apartment \(unit) is being initialized.")
    }
    
    deinit {
        print("Apartment \(unit) is being deinitialized.")
    }
}

var mars: Person? = Person(name: "Mars")
var apt11: Apartment? = Apartment(unit: "11", owner: mars!)

mars!.apartment = apt11
apt11!.tenant = mars

mars = nil
apt11 = nil

//: #### weak reference

//: #### unowned reference

class Country {
    let name: String
    // Implicitly Unwrapped Optional
    var capital: City! // default to nil
    
    init(name: String, capitalName: String) {
        self.name = name
        self.capital = City(name: capitalName, country: self)
    }
}

class City {
    let name: String
    unowned let country: Country
    
    init(name: String, country: Country) {
        self.name = name
        self.country = country
    }
}

var cn: Country? = Country(name: "China", capitalName: "Beijing")
var bj: City? = City(name: "Beijing", country: cn!)






































