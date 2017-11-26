//
//  BestTimeToBuyAndSellStock.swift
//  leetcode
//
//  Created by Xinyi Zhuang on 26/11/2017.
//

import Foundation

func maxProfit(_ prices: [Int]) -> Int {
  if prices.count <= 1 { return 0 }
  var profit = 0
  var dx = 0
  // only cumulate the positive dx can find the max profit
  // i.e [1,5,3] dx = 4 + (-2) = 2 = 3 - 1, so pick 3 and sell 1.
  for i in 1..<prices.count {
    dx += prices[i] - prices[i-1]
    dx = max(0, dx)
    profit = max(dx, profit)
  }
  return profit
}
