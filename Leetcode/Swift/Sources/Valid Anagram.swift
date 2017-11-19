//
//  Valid Anagram.swift
//  leetcode
//
//  Created by Xinyi Zhuang on 18/11/2017.
//

import Foundation

struct ValidAnagram {
  static func isAnagram(_ s: String, _ t: String) -> Bool {
    if s.count != t.count {
      return false
    }
    var memo = [String:Int]()
    for ss in s {
      let key = String(ss)
      if let val = memo[key] {
        memo[key] = val + 1
      } else {
        memo[key] = 1
      }
    }
    for tt in t {
      let key = String(tt)
      if let val = memo[key] {
        if val - 1 == 0 {
          memo.removeValue(forKey: key)
        } else {
          memo[key] = val - 1
        }

      }
    }
    return memo.count == 0
  }
}
