//
//  Roman Numerals Decoder  .swift
//  CodeWarsTasks
//
//  Created by macbook on 27.04.2024.
//

import Foundation

// Create a function that takes a Roman numeral as its argument and returns its value as a numeric decimal integer. You don't
// need to validate the form of the Roman numeral.

// Modern Roman numerals are written by expressing each decimal digit of the number to be encoded separately, starting with the
// leftmost digit and skipping any 0s. So 1990 is rendered "MCMXC" (1000 = M, 900 = CM, 90 = XC) and 2008 is rendered "MMVIII"
// (2000 = MM, 8 = VIII). The Roman numeral for 1666, "MDCLXVI", uses each letter in descending order.

func solution(_ string: String) -> Int {
  let dict: [Character : Int] = [
    "I": 1,
    "V": 5,
    "X": 10,
    "L": 50,
    "C": 100,
    "D": 500,
    "M": 1000
  ]
  
  var previous = 0
  
  return string.reduce(0) { sum, character in
    var sum = sum
    
    if let number = dict[character] {
      sum += number
      
      if number > previous {
        sum -= 2 * previous
      }
      
      previous = number
    }
    
    return sum
  }
}


