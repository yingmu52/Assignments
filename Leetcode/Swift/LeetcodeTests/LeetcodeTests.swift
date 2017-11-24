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

  func testValidAnagram() {
    XCTAssertEqual(ValidAnagram.isAnagram("anagram", "nagaram"), true)
    XCTAssertEqual(ValidAnagram.isAnagram("rat", "car"), false)
    XCTAssertEqual(ValidAnagram.isAnagram("a", "ab"), false)
  }

  func testDiagonalTraverse() {
    let m = [
      [ 1, 2, 3 ],
      [ 4, 5, 6 ],
      [ 7, 8, 9 ]
    ]
    let result = DiagonalTraverse.findDiagonalOrder(m)
    XCTAssertTrue(result.containsSameElements(as: [1,2,3,4,5,6,7,8,9]))
  }

  func testUniquePaths() {
    XCTAssertEqual(UniquePaths.uniquePaths(3, 3), 6)
    XCTAssertEqual(UniquePaths.uniquePaths(25, 9), 10518300)
    XCTAssertEqual(UniquePaths.uniquePaths(23,12), 193536720)
  }

  func testDisappearedNumber() {
   let result = AllNumberDisappearedInArray.findDisappearedNumbers([4,3,2,7,8,2,3,1])
    XCTAssertTrue(result.containsSameElements(as: [5,6]))
  }

  func testFizzBuzz() {
    let expect = ["1", "2", "Fizz", "4", "Buzz", "Fizz", "7", "8", "Fizz", "Buzz", "11", "Fizz", "13", "14", "FizzBuzz"]
    XCTAssertTrue(FizzBuzz.fizzBuzz(15).containsSameElements(as: expect))
  }

  func testSigleNumber() {
    XCTAssertEqual(singleNumber([1,2,3,2,3,1,4,5,5,5,5]), 4)
  }

  func testMoveZeros() {
    var nums = [0,1,0,3,12]
    moveZeroes(&nums)
    XCTAssertTrue(nums.containsSameElements(as: [1,3,12,0,0]))
  }

  func testMajorElement() {
    XCTAssertEqual(majorityElement([6,5,5]), 5)
    XCTAssertEqual(majorityElement([8,8,7,7,7]), 7)
  }
}

extension Array where Element: Comparable {
  func containsSameElements(as other: [Element]) -> Bool {
    return self.count == other.count && self.sorted() == other.sorted()
  }
}
