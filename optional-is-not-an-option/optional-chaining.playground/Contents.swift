//: Playground - noun: a place where people can play

import UIKit

enum Type {
    case CREDIT
    case DEPOSIT
}

class BankCard {
    var type: Type = .CREDIT
}

class Person {
    var card: BankCard?
    
    init(card: BankCard? = nil) {
        self.card = card
    }
}

let nilPerson: Person? = nil
let noCardPerson: Person? = Person()
let creditCardPerson: Person? = Person(card: BankCard())

nilPerson?.card?.type
noCardPerson?.card?.type
creditCardPerson?.card?.type

nilPerson.flatMap({ $0.card }).flatMap({ $0.type })
noCardPerson.flatMap({ $0.card }).flatMap({ $0.type })
creditCardPerson.flatMap({ $0.card }).flatMap({ $0.type })

infix operator => { associativity left }
func =><T, U>(opt: T?, f: T -> U?) -> U? {
    switch opt {
    case .Some(let value):
        return f(value)
    case .None:
        return .None
    }
}

// L nilPerson: Person?
// R { $0.card }
nilPerson=>{ $0.card }=>{ $0.type }
noCardPerson=>{ $0.card }=>{ $0.type }
creditCardPerson=>{ $0.card }=>{ $0.type }




































