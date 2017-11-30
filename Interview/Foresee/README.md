### What is the difference between Delegate and Protocol

`Protocol` is used to declare a set of methods that a class conforms will implement. It enables Communication Between Objects Not Related by Inheritance. 

`Delegate` is a design pattern. It is a way of designing your code to use protocols where necessary. 

### Solid Design Principles ⚠️

`SRP` – Single Responsibility Principle
`OCP` – Open/Closed Principle
`LSP` – Liskov Substitution Principle
`ISP` – Interface Segregation Principle
`DIP` – Dependency Inversion Principle

[More Info](http://deviq.com/solid/)

### What is clean coding, and why you should care

[Clean Code: Explanation, Benefits, and Examples](Clean Code: Explanation, Benefits, and Examples)

### Simple LeetCode Test 

Find number of unique strings in an array.
`i.e ["Cat", "Dog", "Cat", "Dog", "Cat", "Cat", "Pig"]`

```
func countUnique(array: [String]) -> Int {
    var memo: [String: Bool]()
    var count = 0
    for s in array {
        if memo[s] == nil {
            var = var + 1
            memo[s] = true
        }
    }
    return count
}
```

A variation: Find an array of unique strings that keeps its order

```
func countUnique(array: [String]) -> Int {
    var memo: [String: Bool]()
    var res: [String]()
    var count = 0
    for s in array {
        if memo[s] == nil {
            res += [s]
            memo[s] = true
        }
    }
    return res
}
```

### What is the definition of Recursion, and what is the typical problems of using Recursion 

Recursion is a method of solving problems that involves breaking a problem down into smaller subproblems until you get a small enough problem that it can be solved trivially. Usually, recursion involves a function calling itself. 

The typical problem is Memory Leak, Stack Overflow. 

> While it may not seem like much on the surface, recursion allows us to write elegant solutions to problems that may otherwise be very difficult to program.

