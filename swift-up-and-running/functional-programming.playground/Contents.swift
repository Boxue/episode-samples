//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

extension Array {
    func myFilter<Element>(predicate: (Element) -> Bool) -> [Element] {
        var result = [Element]()
        
        for item in self {
            let i = item as? Element;
            
            if let i = i {
                if predicate(i) {
                    result.append(i)
                }
            }
        }
        
        return result
    }
}

var demo = [1, 2, 3, 4, 5, 6, 7].myFilter({ $0 % 2 != 0 })

