//
//  Split Strings.swift
//  CodeWarsTasks
//
//  Created by macbook on 27.04.2024.
//

import Foundation

// Complete the solution so that it splits the string into pairs of two characters. If the string contains an odd number of
// characters then it should replace the missing second character of the final pair with an underscore ('_').

// Examples:
// * 'abc' =>  ['ab', 'c_']
// * 'abcdef' => ['ab', 'cd', 'ef']

func solution(_ str: String) -> [String] {
  var temp = ""
  var result: [String] = []
  
  for (index, char) in str.enumerated() {
    temp += String(char)
    
    if temp.count == 2 {
      result.append(temp)
      temp = ""
    }
    
    if str.count % 2 != 0 && index + 1 == str.count {
      result.append(temp + "_")
    }
  }
  
  return result
}
