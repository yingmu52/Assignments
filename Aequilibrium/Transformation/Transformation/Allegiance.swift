//
//  Allegiance.swift
//  Transformation
//
//  Created by Xinyi Zhuang on 09/11/2017.
//  Copyright © 2017 Xinyi Zhuang. All rights reserved.
//

import Foundation

enum Allegiance: String, CustomStringConvertible {
  case A
  case D

  init?(_ letter: String?) {
    guard let l = letter else { return nil }
    switch l {
    case "A":
      self = .A
    case "D":
      self = .D
    default:
      return nil
    }
  }

  var oppositeDescription: String {
    switch self {
    case .A:
      return "Deceptions"
    case .D:
      return "Autobots"
    }
  }

  var description: String {
    switch self {
    case .A:
      return "Autobots"
    case .D:
      return "Deceptions"
    }
  }
}
