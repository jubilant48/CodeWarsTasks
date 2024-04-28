//
//  Primorial Of a Number.swift
//  CodeWarsTasks
//
//  Created by macbook on 28.04.2024.
//

import Foundation

// Is similar to factorial of a number, In primorial, not all the natural numbers get multiplied, only prime numbers are
// multiplied to calculate the primorial of a number. It's denoted with P# and it is the product of the first n prime numbers.

// Since the passed number is (3) ,Then the primorial should obtained by multiplying  2 * 3 * 5 = 30 .

func numPrimoral(_ number: UInt) -> UInt {
  guard number > 0 else { return 0 }
  guard number != 1 else { return 2 }
  
  var result: UInt = 2
  var num: UInt = 3
  var trueIterate = 1
  
  repeat {
    if isPrime(number: num) {
      trueIterate += 1
      result *= num
      num += 1
    }

    num += 1
  } while trueIterate < number
  
  return result
}

func isPrime(number: UInt) -> Bool {
  guard number >= 2 else { return false }
  guard number != 2 else { return true }
  guard number % 2 != 0 else { return false }
  
  let throughNumber = Int(sqrt(Double(number)))
  
  return !stride(from: 3, through: throughNumber, by: 2).contains { Int(number) % $0 == 0 }
}
