//
//  KeyboardRow.swift
//  leetcode
//
//  Created by Xinyi Zhuang on 24/11/2017.
//

import Foundation

func findWords(_ words: [String]) -> [String] {
  let (s1, s2, s3) = (Set("asdfghjkl"), Set("qwertyuiop"), Set("zxcvbnm"))
  var res = [String]()
  for word in words {
    let s = Set(word.lowercased())
    if s.isSubset(of: s1) || s.isSubset(of: s2) || s.isSubset(of: s3) {
      res += [word]
    }
  }
  return res
}
