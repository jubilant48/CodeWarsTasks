//
//  Roman Numerals Helper.swift
//  CodeWarsTasks
//
//  Created by macbook on 29.04.2024.
//

import Foundation

// Write two functions that convert a roman numeral to and from an integer value. Multiple roman numeral values will be tested
// for each function.

// Modern Roman numerals are written by expressing each digit separately starting with the left most digit and skipping an
// digit with a value of zero. In Roman numerals:
// - 1990 is rendered: 1000=M, 900=CM, 90=XC; resulting in MCMXC
// - 2008 is written as 2000=MM, 8=VIII; or MMVIII
// - 1666 uses each Roman symbol in descending order: MDCLXVI.

// Input range : 1 <= n < 4000

// In this kata 4 should be represented as IV, NOT as IIII (the "watchmaker's four").

// Examples
// to roman:
// 2000 -> "MM"
// 1666 -> "MDCLXVI"
// 86 -> "LXXXVI"
// 1 -> "I"

// from roman:
// "MM"      -> 2000
// "MDCLXVI" -> 1666
// "LXXXVI"  ->   86
// "I"       ->    1

final class RomanNumerals {
  // MARK: - Attributes
  
  static let dictRomansForFrom: [Character : Int] = [
    "I": 1,
    "V": 5,
    "X": 10,
    "L": 50,
    "C": 100,
    "D": 500,
    "M": 1000
  ]
  
  static let arrayRomansForTo: [(Int, String)] = [
    (1000, "M"),
    (900, "CM"),
    (500, "D"),
    (400, "CD"),
    (100, "C"),
    (90, "XC"),
    (50, "L"),
    (40, "XL"),
    (10, "X"),
    (9, "IX"),
    (5, "V"),
    (4, "IV"),
    (1, "I")
  ]
  
  // MARK: - Static func
  
  static func toRoman(_ number: Int) -> String {
    guard number > 0 && number < 4000 else { return String() }
    
    var number = number
    
    return arrayRomansForTo.reduce("") { result, romanRepresentation in
      var result = result
      
      result += String(repeating: romanRepresentation.1, count: number / romanRepresentation.0)
      print(number / romanRepresentation.0)
      print(result)
      number %= romanRepresentation.0
      print(number)
      
      return result
    }
  }
  
  static func fromRoman(_ roman: String) -> Int {
    var previous = 0
    
    return roman.reduce(0) { sum, character in
      var sum = sum
      
      if let number = dictRomansForFrom[character] {
        sum += number
        
        if number > previous {
          sum -= 2 * previous
        }
        
        previous = number
      }
      
      return sum
    }
  }
  
}
