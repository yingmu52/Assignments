import Foundation
//https://leetcode.com/problems/first-unique-character-in-a-string/description/
class FirstUniqueCharacter {
  func firstUniqChar(_ s: String) -> Int {
    var index = -1
    var map = [Character: Int]()
    for c in s {
      if let val = map[c] {
        map[c] = val + 1
      } else {
        map[c] = 0
      }
    }
    for (ind, c) in s.enumerated() {
      if map[c] == 0 {
        index = ind
        return index
      }
    }
    return index
  }
}

