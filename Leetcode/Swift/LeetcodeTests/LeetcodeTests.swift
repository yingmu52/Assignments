//
//  LeetcodeTests.swift
//  LeetcodeTests
//
//  Created by Xinyi Zhuang on 15/11/2017.
//

import XCTest

class LeetcodeTests: XCTestCase {
  func testFirstUniqueCharacter() {
    XCTAssertEqual(FirstUniqueCharacter().firstUniqChar("leetcode"), 0)
    XCTAssertEqual(FirstUniqueCharacter().firstUniqChar("loveleetcode"), 2)
  }

  func testFindPairs() {
    XCTAssertEqual(KDiffPairs.findPairs([3, 1, 4, 1, 5], 2), 2)
    XCTAssertEqual(KDiffPairs.findPairs([1, 2, 3, 4, 5], 1), 4)
    XCTAssertEqual(KDiffPairs.findPairs([1, 3, 1, 5, 4], 0), 1)
    XCTAssertEqual(KDiffPairs.findPairs([-1,0,0,1,0,0,-1], 1), 2)
    XCTAssertEqual(KDiffPairs.findPairs([], 100), 0)
    XCTAssertEqual(KDiffPairs.findPairs([1,2,3,4,5], -1), 0)
  }

  func testCombinationSum() {
    let actual = CombinationSum.combinationSum([2, 3, 6, 7], 7)
    print(actual)
    XCTAssertTrue(actual.count == 2)
  }
}
