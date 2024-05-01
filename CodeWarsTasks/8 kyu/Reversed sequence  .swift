//
//  Reversed sequence  .swift
//  CodeWarsTasks
//
//  Created by macbook on 01.05.2024.
//

import Foundation

// Build a function that returns an array of integers from n to 1 where n>0.

// Example : n=5 --> [5,4,3,2,1]

func reverseSeq(n: Int) -> [Int] {
  return Array(stride(from: n, to: 0, by: -1))
}
