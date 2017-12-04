//
//  SumOfTwoInt.swift
//  leetcode
//
//  Created by Xinyi Zhuang on 03/12/2017.
//

import Foundation

// Use ^ to save the distinct bits and remove the same.
// Use | to Keep as many 1-bits as possible
// & Just selecting certain bits


// "&" AND operation, for example, 2 (0010) & 7 (0111) => 2 (0010)
// "^" XOR operation, for example, 2 (0010) ^ 7 (0111) => 5 (0101)

func getSum(_ a: Int, _ b: Int) -> Int {
  if b == 0 { return a }
  return getSum(a^b, (a&b) << 1)
}
