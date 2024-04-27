//
//  int32 to IPv4.swift
//  CodeWarsTasks
//
//  Created by macbook on 27.04.2024.
//

import Foundation

// Take the following IPv4 address: 128.32.10.1

// This address has 4 octets where each octet is a single byte (or 8 bits).

// 1st octet 128 has the binary representation: 10000000
// 2nd octet 32 has the binary representation: 00100000
// 3rd octet 10 has the binary representation: 00001010
// 4th octet 1 has the binary representation: 00000001
// So 128.32.10.1 == 10000000.00100000.00001010.00000001

// Because the above IP address has 32 bits, we can represent it as the unsigned 32 bit number: 2149583361
// Complete the function that takes an unsigned 32 bit number and returns a string representation of its IPv4 address.

// 2149583361 ==> "128.32.10.1"
// 32         ==> "0.0.0.32"
// 0          ==> "0.0.0.0"

func ipv4(of i32: UInt32) -> String {
  var temp = ""
  var result = ""
  var binaryString = String(i32, radix: 2)
  
  if binaryString.count < 32 {
    let zeroCountAdditional = 32 - binaryString.count
    let zeroString = String(repeating: "0", count: zeroCountAdditional)
    
    binaryString = zeroString + binaryString
  }
  
  for (index, char) in binaryString.enumerated() {
    temp += String(char)
    
    if let num = Int(temp, radix: 2),
       temp.count == 8 {
      let dot = index + 1 == binaryString.count ? "" : "."
      result += String(num) + dot
      temp = ""
    }
    
  }
  
  return result
}
