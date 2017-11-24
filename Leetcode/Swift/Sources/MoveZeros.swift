//
//  MoveZeros.swift
//  leetcode
//
//  Created by Xinyi Zhuang on 23/11/2017.
//

import Foundation

func moveZeroes(_ nums: inout [Int]) {
  var stack = [Int]()
  var i = 0
  while i < nums.count {
    if nums[i] == 0 {
      stack += [nums.remove(at: i)]
      continue
    }
    i = i + 1
  }
  nums += stack
}
