//
//  RatatingString.swift
//  leetcode
//
//  Created by Xinyi Zhuang on 11/03/2018.
//

import Foundation

var i = 0

func rotateString(_ A: String, _ B: String) -> Bool {
  if A == B { return true }
  if i == A.count { return false }
  i = i + 1
  return rotateString(A.shiftLeft, B)
}

extension String {
  var shiftLeft: String {
    let index = self.startIndex
    let nextIndex = self.index(index, offsetBy: 1)
    return String(self[nextIndex...] + self[...index])
  }
}
