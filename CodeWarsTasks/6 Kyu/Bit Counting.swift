//
//  Bit Counting.swift
//  CodeWarsTasks
//
//  Created by macbook on 27.04.2024.
//

import Foundation

// Write a function that takes an integer as input, and returns the number of bits that are equal to one in the binary
// representation of that number. You can guarantee that input is non-negative.
// Example: The binary representation of 1234 is 10011010010, so the function should return 5 in this case

func countBits(_ n: Int) -> Int {
  var binaryString = String(n, radix: 2)
  binaryString.removeAll { $0 == "0" }
  
  return binaryString.count
}
