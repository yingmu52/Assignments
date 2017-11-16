//
//  LeftLeavesSum.swift
//  leetcode
//
//  Created by Xinyi Zhuang on 25/06/2017.
//
//

import Foundation


public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class Solution {
	func isLeaf(_ node: TreeNode?) -> Bool {
		return node != nil && node!.left == nil && node!.right == nil
	}
	func sumOfLeftLeaves(_ root: TreeNode?) -> Int {
		if root == nil { return 0 }
		return sumOfLeftLeaves(root!.right) + (isLeaf(root!.left) ? root!.left!.val : sumOfLeftLeaves(root!.left))
	}
}
