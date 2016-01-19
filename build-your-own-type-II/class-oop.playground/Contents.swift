//: Playground - noun: a place where people can play

import UIKit

class Person {
    let name: String
    let age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func sleep() {
        print("A person sleeps at 10 PM")
    }
}

// Employee derived class or subclass
// Person base class or super class
class Employee : Person {
    let dept: String
    
    init(name: String, age: Int, dept: String) {
        self.dept = dept
        super.init(name: name, age: age)
    }
    
    // Overriding
    override func sleep() {
        print("An employee sleeps at 11 PM")
    }
}

// An employee is A person
// Inheritance
let me = Person(name: "11", age: 34)
let worker = Employee(name: "11", age: 34, dept: "Development")

me.sleep()
worker.sleep()

// Polymorphism

func sleetAlert(person: Person) {
    person.sleep()
}

sleetAlert(me)
sleetAlert(worker)
