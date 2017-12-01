//
//  AddString.swift
//  leetcode
//
//  Created by Xinyi Zhuang on 30/11/2017.
//

import Foundation

func addStrings(_ num1: String, _ num2: String) -> String {
  let nums1 = num1.map { String($0) }
  let nums2 = num2.map { String($0) }
  var (i, j) = (num1.count - 1, num2.count - 1)
  var res = [String]()
  var carry = 0
  while i >= 0 || j >= 0 {
    let n1 = i < 0 ? 0 : Int(nums1[i])!
    let n2 = j < 0 ? 0 : Int(nums2[j])!
    res += [String((n1 + n2 + carry) % 10)]
    carry = (n1 + n2 + carry) / 10
    i = i - 1
    j = j - 1
  }
  if carry > 0 {
    res += [String(carry)]
  }
  return res.reversed().joined()
}
