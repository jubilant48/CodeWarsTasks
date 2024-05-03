//
//  Opposite number  .swift
//  CodeWarsTasks
//
//  Created by macbook on 02.05.2024.
//

import Foundation


// Very simple, given a number (integer / decimal / both depending on the language), find its opposite (additive inverse).
// Examples:

// 1: -1
// 14: -14
// -34: 34


func opposite(number: Double) -> Double {
  return number > 0 ? -number : abs(number)
}
