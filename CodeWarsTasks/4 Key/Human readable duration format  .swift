//
//  Human readable duration format  .swift
//  CodeWarsTasks
//
//  Created by macbook on 30.04.2024.
//

import Foundation

// Your task in order to complete this Kata is to write a function which formats a duration, given as a number of seconds, in a
// human-friendly way.

// The function must accept a non-negative integer. If it is zero, it just returns "now". Otherwise, the duration is expressed as
// a combination of years, days, hours, minutes and seconds.

// It is much easier to understand with an example:
//* For seconds = 62, your function should return "1 minute and 2 seconds"
//* For seconds = 3662, your function should return "1 hour, 1 minute and 2 seconds"

// For the purpose of this Kata, a year is 365 days and a day is 24 hours.

// Note that spaces are important.

// Detailed rules

// The resulting expression is made of components like 4 seconds, 1 year, etc. In general, a positive integer and one of the
// valid units of time, separated by a space. The unit of time is used in plural if the integer is greater than 1.

// The components are separated by a comma and a space (", "). Except the last component, which is separated by " and ", just
// like it would be written in English.

// A more significant units of time will occur before than a least significant one. Therefore, 1 second and 1 year is not
// correct, but 1 year and 1 second is.

// Different components have different unit of times. So there is not repeated units like in 5 seconds and 1 second.

// A component will not appear at all if its value happens to be zero. Hence, 1 minute and 0 seconds is not valid, but it should
// be just 1 minute.

// A unit of time must be used "as much as possible". It means that the function should not return 61 seconds, but 1 minute and
// 1 second instead. Formally, the duration specified by of a component must not be greater than any valid more significant unit
// of time.

func formatDuration(_ seconds: Int) -> String {
  guard seconds > 0 else { return "now" }
  
  var result = ""
  
  let remainSeconds = stringRepresent(for:  "second", number: seconds % 60)
  let minutes = stringRepresent(for: "minute", number: (seconds) / 60 % 60)
  let hours = stringRepresent(for: "hour", number: (seconds / 3600) % 24)
  let days = stringRepresent(for: "day", number: (seconds / 86400) % 365)
  let years = stringRepresent(for: "year", number: seconds / 31536000)
  
  var arrayStrings = [years, days, hours, minutes, remainSeconds].filter { !$0.isEmpty }
  var arraySlice = arrayStrings.count >= 2 ? arrayStrings.dropLast(2) : arrayStrings
  
  result = arraySlice.reduce("") { result, newLine in
    if !result.isEmpty && !newLine.isEmpty {
      return result + ", " + newLine
    } else {
      return newLine
    }
  }
  
  if arrayStrings.count >= 2 {
    result = lastFormatRepresentation(mainString: result,
                                      arrayStrings[arrayStrings.endIndex - 2],
                                      arrayStrings[arrayStrings.endIndex - 1])
  }
  
  return result
}

fileprivate func lastFormatRepresentation(mainString: String, _ formatOne: String, _ formatTwo: String) -> String {
  switch (formatOne.isEmpty, formatTwo.isEmpty) {
  case (false, true), (true, false):
    if !formatOne.isEmpty {
      return mainString.isEmpty ? formatOne : mainString + ", " + formatOne
    }
    
    if !formatTwo.isEmpty {
      return mainString.isEmpty ? formatTwo : mainString + ", " + formatTwo
    }
    
  case (false, false):
    return mainString.isEmpty ? "\(formatOne) and \(formatTwo)" : mainString + ", " + "\(formatOne) and \(formatTwo)"
    
  default:
    return mainString
  }
  
  return mainString
}

fileprivate func stringRepresent(for name: String, number: Int) -> String {
  guard number != 0 else { return "" }
  
  return number == 1 ? "\(number) \(name)" : "\(number) \(name)s"
}
