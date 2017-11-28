//
//  MaxSubArray.swift
//  leetcode
//
//  Created by Xinyi Zhuang on 27/11/2017.
//

import Foundation

// Kadane's algorithm
func maxSubArray(_ nums: [Int]) -> Int {
  guard let first = nums.first else { return 0 }
  var (maxCurrent, maxSofar) = (first, first)
  for i in 1..<nums.count {
    // cumulative is less effective, set new current to be current n
    maxCurrent = max(nums[i], maxCurrent + nums[i])
    maxSofar = max(maxSofar, maxCurrent)
  }
  return maxSofar
}
