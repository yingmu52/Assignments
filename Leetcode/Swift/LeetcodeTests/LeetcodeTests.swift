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
}
