import Foundation
// https://leetcode.com/problems/01-matrix/#/description
class MatrixDistance {

	var visitedMap : [String] = [] // i,j -> a,b
	static let MAX = Int.max - 1
	func updateMatrix(_ matrix: [[Int]]) -> [[Int]] {
		var dp = matrix
		let (row, col) = (dp[0].count - 1, dp.count - 1)
		for i in 0...col {
			for j in 0...row {
				dp[i][j] = DFS(i,j,matrix)
				visitedMap = []
			}
		}
		return dp
	}
	
	// FIXME: the answer of DFS is incorrect :(
	func DFS(_ i: Int, _ j: Int, _ m: [[Int]]) -> Int {
		visitedMap += ["\(i)-\(j)"]
		if m[i][j] == 0 { return 0 }
		var min = MatrixDistance.MAX
		let (row, col) = (m[0].count - 1 , m.count - 1)
		let directions = [(-1,0),(1,0),(0,-1),(0,1)]
		
		for (p, k) in directions {
			let (a,b) = (i + p, j + k) // left, right, down, up
			if !(0...col ~= a && 0...row ~= b)  { continue }
			if m[a][b] == 0 { return 1 }
			if visitedMap.contains("\(a)-\(b)") { return min } // if visited return current miminum
			
			let near = DFS(a,b,m) + 1
			if near < min { min = near}
		}
		return min
	}

	// FIXME: the answer of BFS exceed time limit
	func BFS(_ matrix: [[Int]]) -> [[Int]] {
		var m = matrix
		let (row, col) = (m[0].count - 1, m.count - 1)
		let max = row + col
		var queue : [(Int,Int)] = []
		for i in 0...col {
			for j in 0...row {
				m[i][j] == 0 ? queue += [(i,j)] : (Void)(m[i][j] = max)
			}
		}
		while (queue.count > 0) {
			let (i,j) = queue.removeFirst()
			for (p,k) in [(-1,0),(1,0),(0,-1),(0,1)] {
				let (a,b) = (i + p, j + k)
				if !(0...col ~= a && 0...row ~= b) { continue }
				if m[a][b] == max { queue += [(a,b)] }
				m[a][b] = [m[i][j] + 1, m[a][b]].min()!
			}
		}
		return m
	}

}





