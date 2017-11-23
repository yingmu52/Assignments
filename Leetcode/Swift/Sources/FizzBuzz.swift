//
//  FizzBuzz.swift
//  leetcode
//
//  Created by Xinyi Zhuang on 22/11/2017.
//

import Foundation

struct FizzBuzz {
  static func fizzBuzz(_ n: Int) -> [String] {
    var res = [String]()
    for i in 1...n {
      switch i {
      case let x where x % 3 == 0 && x % 5 == 0:
        res += ["FizzBuzz"]
      case let x where x % 3 == 0:
        res += ["Fizz"]
      case let x where x % 5 == 0:
        res += ["Buzz"]
      default:
        res += [String(i)]
      }
    }
    return res
  }
}
