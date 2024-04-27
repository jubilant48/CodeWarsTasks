//
//  Number of trailing zeros of N!.swift
//  CodeWarsTasks
//
//  Created by macbook on 27.04.2024.
//

import Foundation

// Write a program that will calculate the number of trailing zeros in a factorial of a given number.
// N! = 1 * 2 * 3 *  ... * N
// Be careful 1000! has 2568 digits...

// zeros(6) = 1
// # 6! = 1 * 2 * 3 * 4 * 5 * 6 = 720 --> 1 trailing zero

//zeros(12) = 2
// # 12! = 479001600 --> 2 trailing zeros

// Hint: You're not meant to calculate the factorial. Find another way to find the number of zeros.

func zeros(_ n: UInt32) -> UInt32 {
  if n < 1 { return 0 }
  
  let kMax = abs(log(Double(n)) / log(5))
  var temp: UInt32 = 0
  
  for k in stride(from: 1, to: kMax, by: 1) {
    let i = pow(5, k)
    temp += UInt32(abs(Double(n) / i))
  }
  
  return temp
}
