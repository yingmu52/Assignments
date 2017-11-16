//
//  MaxProduct.swift
//  leetcode
//
//  Created by Xinyi Zhuang on 25/06/2017.
//
//

import Foundation

class MaxProduct {
	func maximumProduct(_ nums: [Int]) -> Int {
		var sorted = nums
		sorted = sorted.sorted { return $0 < $1 }
		let n = sorted.count
		let candidate1 = sorted[n-3] * sorted[n-1] * sorted[n-2]
		let candidate2 = sorted[0] * sorted[1] * sorted[n-1]
		return candidate1 > candidate2 ? candidate1 : candidate2
	}
}

