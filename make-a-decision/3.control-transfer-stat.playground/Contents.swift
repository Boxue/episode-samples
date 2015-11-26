//: Playground - noun: a place where people can play

import UIKit

//: ### Control transfer statment

//: #### continue

for number in 1...10 {
    if number % 2 != 0 {
        continue
    }
    print(number)
}

// while / repeat ... while 

//: #### break

// break in loop

for number in 1...10 {
    if number == 6 {
        break
    }
    print(number)
}

print("break at six")

// while / repeat ... while

// break in switch...case

let vowel: Character = "a"

switch vowel {
case "a":
    print("\(vowel) is a vowel.")
case "e":
    print("\(vowel) is a vowel.")
case "i":
    print("\(vowel) is a vowel.")
case "o":
    print("\(vowel) is a vowel.")
case "u":
    print("\(vowel) is a vowel.")
default:
    break
}

//: #### fallthrough

switch vowel {
case "a", "e", "i", "o", "u":
    print("\(vowel) is a vowel.")
    fallthrough
default:
    print("There are 5 vowels in English.")
    break
}

//: #### guard

for number in [5, 4, 0, 2, 1] {
    guard number != 0 else {
        break
    }
    print(100 / number)
}

//: #### return & throw
//: https://github.com/boxue