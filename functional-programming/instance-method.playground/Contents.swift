//: Playground - noun: a place where people can play

import UIKit

// Instance methods

class BankCard {
    var balance: Double = 0
    
    func deposit(amount: Double) {
        self.balance += amount
        print("Current balance: \(self.balance)")
    }
}

let card = BankCard()
card.deposit(100)

let atm = BankCard.deposit
let depositor = atm(card)

depositor(100)
depositor(100)
depositor(100)
depositor(100)
depositor(100)