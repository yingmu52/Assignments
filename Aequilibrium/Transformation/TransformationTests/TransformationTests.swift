//
//  TransformationTests.swift
//  TransformationTests
//
//  Created by Xinyi Zhuang on 08/11/2017.
//  Copyright © 2017 Xinyi Zhuang. All rights reserved.
//

import XCTest
@testable import Transformation

class TransformationTests: XCTestCase {
  
  override func setUp() {
    super.setUp()
  }
  
  override func tearDown() {
    super.tearDown()
  }
  
  func testInit() {
    let t1 = Transformer(["Test", "A"], [1,2,3,4,5,6,7,8])
    XCTAssertNotNil(t1)
    XCTAssertEqual(t1?.overallRating, 17)
    let t2 = Transformer(["Test", "D"], [5,5,5,5,5,5,5,5])
    XCTAssertEqual(t2?.overallRating, 25)
    XCTAssertNotNil(t2)
    XCTAssertNil(Transformer(["Test", "D"], [1,2,3,4,5,6,7]))
    XCTAssertNil(Transformer(["Test", "Cat"], [1,2,3,4,5,6,7,8]))
    XCTAssertNil(Transformer(["Test"], [1,2,3,4,5,6,7,8]))
  }

  func testSort() {
    let t1 = Transformer(["Test", "A"], [5,5,5,5,1,5,5,5])!
    let t2 = Transformer(["Test", "A"], [5,5,5,5,2,5,5,5])!
    let t3 = Transformer(["Test", "A"], [5,5,5,5,3,5,5,5])!
    let t4 = Transformer(["Test", "A"], [5,5,5,5,4,5,5,5])!
    let t5 = Transformer(["Test", "A"], [5,5,5,5,5,5,5,5])!
    let unorder = [t3,t4,t2,t5,t1].sortedByRank
    for i in 0...4 {
      XCTAssertEqual(unorder[i].rank, unorder.count - i)
    }
  }

  func testOneOnOne() {
    let t1 = Transformer(["Optimus Prime", "A"], [5,5,5,5,5,5,5,5])!
    let t2 = Transformer(["Predaking", "D"], [5,5,5,5,5,5,5,5])!
    let t3 = Transformer(["Justin", "A"], [10,10,10,10,10,10,10,10])!
    let t4 = Transformer(["Justin Jr.", "A"], [9,9,9,9,9,9,9,9])!
    let t5 = Transformer(["Justin Jr. Less Courage & Strengh", "A"], [3,10,10,10,10,3,10,5])!
    let t6 = Transformer(["Justin Jr. More skill, less overall", "A"], [1,1,1,1,1,1,1,8])!
    // tie
    XCTAssertNil(t1.battle(opponent: t1))
    XCTAssertNil(t2.battle(opponent: t2))
    XCTAssertNil(t3.battle(opponent: t3))
    XCTAssertNil(t1.battle(opponent: t2))
    XCTAssertNil(t2.battle(opponent: t1))
    XCTAssertNil(t4.battle(opponent: t4))

    // win
    XCTAssertTrue(t1.battle(opponent: t3) == true)
    XCTAssertTrue(t2.battle(opponent: t3) == true)

    // fail
    XCTAssertFalse(t4.battle(opponent: t3) == true)
    XCTAssertFalse(t5.battle(opponent: t4) == true)
    XCTAssertFalse(t5.battle(opponent: t6) == true)
  }

  func testGroupFight() {
    let t1 = Transformer(["Soundwave", "D"], [8,9,2,6,7,5,6,10])!
    let t2 = Transformer(["Bluestreak","A"],[6,6,7,9,5,2,9,7])!
    let t3 = Transformer(["Hubcap", "A"],[4,4,4,4,4,4,4,4])!
    let (n, winner, loser) = [t1].battle(opponents: [t2, t3])
    XCTAssertEqual(n, 1)
    XCTAssertEqual(winner, [t1])
    XCTAssertEqual(loser, [t3])

  }
}

extension Transformer: Equatable {
  static func ==(lhs: Transformer, rhs: Transformer) -> Bool {
    return lhs.name == rhs.name &&
    lhs.type == rhs.type &&
    lhs.strength == rhs.strength &&
    lhs.courage == rhs.courage &&
    lhs.endurance == rhs.endurance &&
    lhs.firepower == rhs.firepower &&
    lhs.intelligence == rhs.intelligence &&
    lhs.rank == rhs.rank &&
    lhs.skill == rhs.skill
  }
}
