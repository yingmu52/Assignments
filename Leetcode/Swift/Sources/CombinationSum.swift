//
//  CombinationSum.swift
//  leetcode
//
//  Created by Xinyi Zhuang on 18/11/2017.
//

import Foundation

struct CombinationSum {
  static func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
    var result = [[Int]]()
    var solution = [Int]()
    search(&result, &solution, candidates, target, 0)
    return result
  }

  static func search(_ result: inout [[Int]],
                     _ solution: inout [Int],
                     _ candidates: [Int],
                     _ target: Int,
                     _ start: Int) {
    if target > 0 {
      for i in start..<candidates.count {
        let num = candidates[i]
        if target < num { continue }
        solution += [num] // add current number to test if it is valid candidate
        search(&result, &solution, candidates, target - num, i)
        solution.removeLast() // remove last num in response to line 27 after testing candidate
      }
    } else { // target == 0
      result += [solution]
    }
  }
}
