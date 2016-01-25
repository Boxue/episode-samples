//: Playground - noun: a place where people can play

import UIKit

//: #### Map

func strToEmoji(str: String) -> Character {
    // \N{str}
    let tmp = "\\N{\(str)}"
    let emoji = tmp.stringByApplyingTransform(
        NSStringTransformToUnicodeName, reverse: true)
    
    return emoji!.characters.first!
}

strToEmoji("TIGER")

let animals = ["TIGER", "DRAGON", "CAT"]
let animalEmojis = animals.map(strToEmoji)

extension Array {
    func myMap<SrcType, DestType>(transform: (SrcType) -> DestType) -> [DestType] {
        var output: [DestType] = []
        
        for item in self {
            let transformed = transform(item as! SrcType)
            output.append(transformed)
        }
        
        return output
    }
    
    func myReduce<C, T>(initial: C, combine: (C, T) -> C) -> C {
        var seed = initial
        
        for item in self {
            seed = combine(seed, item as! T)
        }
        
        return seed
    }
}

let myEmojis = animals.myMap(strToEmoji)

//: #### reduce

var numbers: [Int] = []

for i in 1...10 {
    numbers.append(i)
}

let sum = numbers.reduce(0, combine: { $0 + $1 })
let sum1 = numbers.myReduce(0, combine: { $0 + $1 })
sum
sum1
