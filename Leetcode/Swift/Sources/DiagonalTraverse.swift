//
//  DiagonalTraverse.swift
//  leetcode
//
//  Created by Xinyi Zhuang on 21/11/2017.
//

import Foundation

struct DiagonalTraverse {
  static func findDiagonalOrder(_ matrix: [[Int]]) -> [Int] {
    var res = [Int]()
    if matrix.count == 0 { return res }
    let (m, n) = (matrix.count, matrix[0].count)
    var (i, j) = (0, 0)
    for _ in 0..<m*n {
      res.append(matrix[i][j])
      if (i + j) % 2 != 0 { // moving down
        if i == m - 1 { // reached to the bottom border
          j = j + 1 // move right
        } else if ( j == 0 ) { // reached to left border
          i = i + 1 // move down
        } else { // move bottom left
          i = i + 1
          j = j - 1
        }
      } else { // moving up
        if j == n - 1 { // reached to right border
          i = i + 1 // move down
        } else if i == 0 {
          j = j + 1 // move right
        } else { // move top right
          i = i - 1
          j = j + 1
        }
      }
    }
    return res
  }
}
