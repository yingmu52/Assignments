//
//  AllNumberDisappearedInArray.swift
//  leetcode
//
//  Created by Xinyi Zhuang on 22/11/2017.
//

import Foundation

struct AllNumberDisappearedInArray {
 static func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
    var nums = nums
    for n in 0..<nums.count {
      let index = abs(nums[n]) - 1
      nums[index] = nums[index] > 0 ? -nums[index] : nums[index]
    }
    var res = [Int]()
    for i in 0..<nums.count {
      if nums[i] > 0 {
        res += [i+1]
      }
    }
    return res
  }
}
