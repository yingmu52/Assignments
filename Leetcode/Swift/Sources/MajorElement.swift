//
//  MajorElement.swift
//  leetcode
//
//  Created by Xinyi Zhuang on 23/11/2017.
//

import Foundation

func majorityElement(_ nums: [Int]) -> Int {
  var (maxCount, maxIndex) = (0, 0)
  var memo = [Int: Int]()
  for (i, n) in nums.enumerated() {
    guard let count = memo[n] else {
      memo[n] = 1
      continue
    }
    memo[n] = count + 1
    if count + 1 > maxCount {
      maxCount = count
      maxIndex = i
    }
  }
  return nums[maxIndex]
}
