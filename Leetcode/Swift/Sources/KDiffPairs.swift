//
//  KDiffPairs.swift
//  leetcode
//
//  Created by Xinyi Zhuang on 16/11/2017.
//

import Foundation

struct KDiffPairs {
  static func findPairs(_ nums: [Int], _ k: Int) -> Int {
    var count = 0
    if nums.count == 0 || k < 0 {
      return 0
    }
    var memo = [Int: Int]()
    for i in 0..<nums.count {
      memo[nums[i]] = i
    }

    for i in 0..<nums.count {
      let key = nums[i] + k
      if memo[key] != nil, memo[key] != i {
        count = count + 1
        memo.removeValue(forKey: key)
      }
    }
    return count
  }
}
