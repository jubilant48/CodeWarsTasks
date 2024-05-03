//
//  Beginner - Reduce but Grow.swift
//  CodeWarsTasks
//
//  Created by macbook on 03.05.2024.
//

import Foundation

// Given a non-empty array of integers, return the result of multiplying the values together in order. Example:
// [1, 2, 3, 4] => 1 * 2 * 3 * 4 = 24

func grow(_ arr: [Int]) -> Int {
  return arr.reduce(1, *)
}
