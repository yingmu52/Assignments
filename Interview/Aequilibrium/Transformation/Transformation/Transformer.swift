//
//  Transformer.swift
//  Transformation
//
//  Created by Xinyi Zhuang on 08/11/2017.
//  Copyright © 2017 Xinyi Zhuang. All rights reserved.
//

import Foundation

struct Transformer {

  var strength, intelligence, speed, endurance, rank, courage, firepower, skill: Int
  var name: String
  var type: Allegiance
  private let rawSpec: [Int]

  init?(_ info: [String], _ spec: [Int]) {
    if spec.count != 8 { return nil }
    guard
      let name = info.first,
      let type = Allegiance(info.last) else { return nil }
    self.name = name
    self.type = type
    self.strength = spec[0]
    self.intelligence = spec[1]
    self.speed = spec[2]
    self.endurance = spec[3]
    self.rank = spec[4]
    self.courage = spec[5]
    self.firepower = spec[6]
    self.skill = spec[7]
    self.rawSpec = spec
  }

  var overallRating: Int {
    return strength + intelligence + speed + endurance + firepower
  }

  func battle(opponent: Transformer) -> Bool? { // true for win, nil for tie
    // special rules
    let (op, pk) = ("Optimus Prime", "Predaking")
    switch (self.name, opponent.name) {
    case (op, pk), (op, op), (pk, op), (pk, pk):
      return nil // tie
    case (op, _), (pk, _):
      return true
    case (_, pk), (_, op):
      return false
    default:
      break
    }
    // basic rules
    var result: Bool?
    switch (self.courage - opponent.courage, self.strength - opponent.strength) {
    case (4..., 3...):
      return true
    case (...(-4), ...(-3)):
      return false
    default:
      break
    }
    if abs(self.skill - opponent.skill) >= 3 {
      result = self.skill > opponent.skill
    } else if self.overallRating != opponent.overallRating {
      result = self.overallRating > opponent.overallRating
    } else {
      return nil
    }
    return result
  }
}

extension Sequence where Iterator.Element == Transformer {
  var sortedByRank: [Transformer] {
    return self.sorted { $0.rank >= $1.rank }
  }

  // return tuple (battles, winner, loser) for better testability
  func battle(opponents: [Transformer]) -> (Int, [Transformer], [Transformer]) {
    var (t1, t2) = (self.sortedByRank, opponents.sortedByRank) // sort by rank
    var (s1, s2) = (0, 0) // victory scores 1
    let (len1, len2) = (self.sortedByRank.count, opponents.count)
    let nBattles = len1 >= len2 ? len2 : len1

    var i = 1
    while i <= nBattles {
      guard let tt1 = t1.first, let tt2 = t2.first else { break }
      guard let result = tt1.battle(opponent: tt2) else {
        t1.removeFirst()
        t2.removeFirst()
        i = i + 1
        continue
      }
      if result {
        s1 = s1 + 1
        t2.removeFirst()
      } else {
        s2 = s2 + 1
        t1.removeFirst()
      }
      i = i + 1
    }

    let victor = s1 >= s2 ? t1 : t2
    let losers = s1 >= s2 ? t2 : t1
    return (nBattles, victor, losers)
  }

  // this function is for UI
  func battle(_ opponents: [Transformer]) -> String {
    var summary = String()
    let r = self.battle(opponents: opponents)
    summary.append("\(r.0) battles \n\n")
    summary.append("Winning team (\(r.1.first?.type.description ?? "")): ")
    summary.append(r.1.map { $0.name }.joined(separator: ", ") + "\n\n")
    if r.2.count == 0 {
      summary.append("No Survivors from the losing team (\(r.1.first!.type.oppositeDescription))")
    } else {
      summary.append("Survivors from the losing team (\(r.2.first!.type.description)): ")
      summary.append(r.2.map {$0.name }.joined(separator: ", ") + "\n")
    }
    return summary
  }
}

extension Transformer: CustomStringConvertible {
  var description: String {
    return "\(self.name),\(self.type.rawValue)," + self.rawSpec.map { String($0) }.joined(separator: ",")
  }
}


