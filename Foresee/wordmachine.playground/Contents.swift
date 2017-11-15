//: Playground - noun: a place where people can play

import UIKit


public func solution(_ S : inout String) -> Int {
  var stack = [Int]()
  let operations = S.components(separatedBy: " ")
  for element in operations {
    print(stack)
    if let n = Int(element) {
      stack.append(n)
    } else {
      switch element {
      case "POP":
        if stack.count >= 1 {
          stack.removeLast()
        } else {
          return -1
        }
      case "DUP":
        if stack.count >= 1 {
          stack.append(stack.last!)
        } else {
          return -1
        }
      case "+":
        if stack.count < 2 {
          return -1
        } else {
          let add = stack.removeLast() + stack.removeLast()
          if add < Int(pow(Double(2), Double(20))) - 1 {
            stack.append(add)
          } else {
            return -1
          }
        }
      case "-":
        if stack.count < 2 {
          return -1
        } else {
          let sub = stack.removeLast() - stack.removeLast()
          if sub > 0 {
            stack.append(sub)
          } else {
            return -1
          }
        }
      default: // invalid operation
        return -1
      }
    }
  }
  return stack.count > 0 ? stack.last! : -1
}

var s = "13 DUP 4 POP 5 DUP + DUP + -"
print("Input:", s, "Output:", solution(&s)) // 7

var s1 = "5 3 + -"
print("Input:", s1, "Output:", solution(&s1)) // -1 error
