import Foundation

class ClimbStairs {
    var memo = [1:1, 2:2]
    func climbStairs(_ n: Int) -> Int {
        var total = 0
        if let cache = memo[n] {
            total = total + cache
        }else{
            total = total + climbStairs(n-1) + climbStairs(n-2)
            memo[n] = total
        }
        return total
    }

    func climbStairs2(_ n: Int) -> Int {
        if n <= 2 { return n }
        var result = Array(repeating: 0, count: n+1)
        result[1] = 1
        result[2] = 2
        for i in 3...n { 
            result[i] = result[i-1] + result[i-2] 
        }
        return result[n]
    }
}