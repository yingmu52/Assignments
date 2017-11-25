//
//  SelfDividingNumbers.swift
//  leetcodePackageDescription
//
//  Created by Xinyi Zhuang on 24/11/2017.
//

import Foundation

func selfDividingNumbers(_ left: Int, _ right: Int) -> [Int] {
  var res = [Int]()
  for num in left...right {
    var found = true
    let digits = String(num).flatMap ({ Int(String($0)) })
    for n in digits {
      found = found && (n != 0 && num % n == 0)
    }
    if found { res += [num] }
  }
  return res
}
