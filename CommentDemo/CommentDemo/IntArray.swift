//
//  IntArray.swift
//  CommentDemo
//
//  Created by Mars on 6/20/16.
//  Copyright © 2016 Boxue. All rights reserved.
//

import Foundation

struct IntArray {
    /// A **demo** function
    func demo() {}
    
    /**
      * item1
      * item2
      * item3
     */
    /**
     # IMPORTANT: something important you want to mention:
     A general descripiton here.
     1. item1
     1. item2
     1. item3
     ---
     [More info - Access boxueio.com](https://boxueio.com)
     */
    func listDemo() {}
    
    /// Returns a subsequence containing all but the specified number of final
    /// elements.
    ///
    /// If the number of elements to drop exceeds the number of elements in the
    /// collection, the result is an empty subsequence.
    ///
    ///     let numbers = [1, 2, 3, 4, 5]
    ///     print(numbers.dropLast(2))
    ///     // Prints "[1, 2, 3]"
    ///     print(numbers.dropLast(10))
    ///     // Prints "[]"
    ///
    /// - Parameter n: The number of elements to drop off the end of the collection.
    ///   `n` must be greater than or equal to zero.
    ///
    /// - Returns: A subsequence that leaves off `n` elements from the end.
    ///
    /// - Complexity: O(*n*), where *n* is the number of elements to drop.
    func dropLast(_ n: Int) -> IntArray { return IntArray() }
}
