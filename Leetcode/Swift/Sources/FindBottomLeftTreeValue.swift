//
//  FindBottomLeftTreeValue.swift
//  leetcode
//
//  Created by Xinyi Zhuang on 17/11/2017.
//

import Foundation

struct FindBottomLeftTreeValue {
  static func findBottomLeftValue(_ root: TreeNode?) -> Int {
    // You may assume the tree (i.e., the given root node) is not NULL.
    var queue = [root!]
    var result = -1
    while !queue.isEmpty {
      result = queue.first!.val
      // every for loop is a horizontal traverse at current depth
      for _ in 0..<queue.count {
        let note = queue.removeFirst()
        if let left = note.left { queue += [left] }
        if let right = note.right { queue += [right] }
      }
    }
    return result
  }
}
