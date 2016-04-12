//: Playground - noun: a place where people can play

import UIKit

//: ### Basic Loop and condition control

// for / while
// if / switch

//: for 

for var i = 0; i < 10; i += 1 {
    print(i)
}

let vowel = ["a", "e", "i", "o", "u"]

for char in vowel {
    print(char)
}

for number in 1...100 {
    print(number)
    
}

for _ in 1...10 {
    print("*", terminator:"")
}

//: while

var i  = 0
while i < 10 {
    print(i)
    i += 1
}

// do ... while
var n  = 0

repeat {
    print(vowel[n])
    n += 1
} while n < 5

//: if

var PI = 3.14

if PI == 3.14 {
}
else if PI == 3.14159 {
}
else if PI == 3.1415926 {
}
else {

}
