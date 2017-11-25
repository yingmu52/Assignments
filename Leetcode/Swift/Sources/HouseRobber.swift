//
//  HouseRobber.swift
//  leetcode
//
//  Created by Xinyi Zhuang on 24/11/2017.
//

import Foundation

func rob(_ nums: [Int]) -> Int {
  var take = 0
  var notTake = 0
  for i in 0..<nums.count {
    if i % 2 == 0 {
      take = max(take + nums[i], notTake)
    } else {
      notTake = max(notTake + nums[i], take)
    }
  }
  return max(take, notTake)
}
