//
//  SingleNumber.swift
//  leetcode
//
//  Created by Xinyi Zhuang on 22/11/2017.
//

import Foundation

func singleNumber(_ nums: [Int]) -> Int {
  var res = 0
  for n in nums {
    res ^= n
  }
  return res
}
