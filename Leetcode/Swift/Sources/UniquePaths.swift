//
//  UniquePaths.swift
//  leetcode
//
//  Created by Xinyi Zhuang on 21/11/2017.
//

import Foundation

struct UniquePaths {
  static func uniquePaths(_ m: Int, _ n: Int) -> Int {
    var memo = [String: Int]()
    return search(m, n, &memo)
  }

  private static func search(_ m: Int, _ n: Int, _ memo: inout [String: Int]) -> Int {
    if m == 1 || n == 1 { return 1 }
    let key = String(m) + "-" + String(n)
    if let c = memo[key] { return c }
    let count = search(m-1, n, &memo) + search(m, n-1, &memo)
    memo[key] = count
    return count
  }
}
