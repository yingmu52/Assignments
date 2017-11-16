import UIKit

public func solution(_ S : inout String) -> Int {
  var stack = [Int]()
  let operations = S.components(separatedBy: " ")
  for element in operations {
    if let n = Int(element) {
      stack.append(n)
    } else {
      switch element {
      case "POP":
        // make sure at least 1 to pop
        guard let _ = stack.last else { return -1 }
        stack.removeLast()
      case "DUP":
        // make sure at least 1 to duplicate
        guard let last = stack.last else { return -1  }
        stack.append(last)
      case "+":
        if stack.count < 2 {
          return -1
        } else {
          let add = stack.removeLast() + stack.removeLast()
          if add < Int(pow(Double(2), Double(20))) - 1 {
            stack.append(add)
          } else {
            return -1 // overflow
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
            return -1 // underflow
          }
        }
      default:
        return -1
      }
    }
  } // end of for loop
  return stack.count > 0 ? stack.last! : -1
}

var s = "13 DUP 4 POP 5 DUP + DUP + -"
var s1 = "5 3 + -"

print("Input:", s, "Output:", solution(&s)) // 7
print("Input:", s1, "Output:", solution(&s1)) // -1 error
