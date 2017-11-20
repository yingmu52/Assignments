//
//  ReshapeTheMatrix.swift
//  leetcode
//
//  Created by Xinyi Zhuang on 20/11/2017.
//

import Foundation

struct ReshapeTheMatrix {
  static func matrixReshape(_ nums: [[Int]], _ r: Int, _ c: Int) -> [[Int]] {
    let (n, m) = (nums.count, nums.first!.count)
    if n * m != r * c { return nums }
    var res = Array(repeating: Array(repeating: 0, count: c), count: r)
    for i in 0..<r*c {
      res[i/c][i%c] = nums[i/m][i%m]
    }
    return res
  }
}
