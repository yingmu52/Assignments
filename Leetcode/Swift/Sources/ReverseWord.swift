//
//  ReverseWord.swift
//  leetcode
//
//  Created by Xinyi Zhuang on 29/11/2017.
//

import Foundation

func reverseWords(_ s: String) -> String {
  let words = s.components(separatedBy: " ")
  var res = [String]()
  for w in words {
    var reversedWord = ""
    for c in w.reversed() {
      reversedWord.append(c)
    }
    res.append(reversedWord)
  }
  return res.joined(separator: " ")
}
