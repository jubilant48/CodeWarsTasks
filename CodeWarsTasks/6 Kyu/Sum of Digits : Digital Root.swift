//
//  Sum of Digits : Digital Root.swift
//  CodeWarsTasks
//
//  Created by macbook on 27.04.2024.
//

import Foundation

// Digital root is the recursive sum of all the digits in a number.

// Given n, take the sum of the digits of n. If that value has more than one digit, continue reducing in this way until a
// single-digit number is produced. The input will be a non-negative integer.

// 16  -->  1 + 6 = 7
// 942  -->  9 + 4 + 2 = 15  -->  1 + 5 = 6
// 132189  -->  1 + 3 + 2 + 1 + 8 + 9 = 24  -->  2 + 4 = 6
// 493193  -->  4 + 9 + 3 + 1 + 9 + 3 = 29  -->  2 + 9 = 11  -->  1 + 1 = 2

func digitalRoot(of number: Int) -> Int {
  var arrayNum: [Int] = []
  var stringNum = String(number)
  var result: Int
  
  repeat {
    arrayNum = stringNum.map { Int(String($0))! }
    result = arrayNum.reduce(0, +)
    
    if result > 9 {
      arrayNum = []
      stringNum = String(result)
    }
    
  } while result > 9
  
  return result
}
