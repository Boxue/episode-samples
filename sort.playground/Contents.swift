//: Playground - noun: a place where people can play

import UIKit

func insertionSort(numberList: Array<Int>) -> Array<Int> {
    //check for trivial case
    guard numberList.count > 1 else {
        return numberList
    }
    
    //mutated copy
    var output = numberList
    
    for primaryindex in 0 ..< output.count {
        let key = output[primaryindex]
        var secondaryindex = primaryindex
        
        while secondaryindex > -1 {
            if key < output[secondaryindex] {
                //move into correct position
                output.remove(at: secondaryindex + 1)
                output.insert(key, at: secondaryindex)
            }
            
            secondaryindex -= 1 
        }
    }
    
    return output 
}

let a = [4, 1, 6, 7, 0, 5, 2]

let b = insertionSort(numberList: a)

