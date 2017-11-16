
import Foundation

class HammingDistance {
	func totalHammingDistance(_ nums: [Int]) -> Int {
		if nums.count <= 1 { return 0 }
		var total = 0
		// 1. list all combination
		let allCombo : ([Int]) -> [(Int,Int)] = { nums in
			var arr = [(Int,Int)]()
			for i in 0...nums.count - 2 {
				for j in i + 1...nums.count - 1 {
					arr += [(nums[i],nums[j])]
				}
			}
			return arr
		}
		// 2. Int -> Binary
		let toBinary : (Int) -> String = { num in
			return String(num, radix: 2)
		}
		// 3. Pad Binary
		let fillZero : (String,Int) -> String = { (str,size) in
			var s = str
			for _ in 0..<(size - s.count) { s = "0" + s }
			return s
		}
		// 4. Compare
		let maxLen = toBinary(nums.max()!).count
		for (n1,n2) in allCombo(nums) {
			let s1 = fillZero(toBinary(n1), maxLen)
			let s2 = fillZero(toBinary(n2), maxLen)
			for (c1,c2) in zip(s1, s2) {
				total += c1 == c2 ? 0 : 1
			}
		}
		return total
	}
	
	func totalHammingDistance2(_ nums: [Int]) -> Int {
		var (total,n) = (0, nums.count)
		for j in 0 ..< 32 {
			var bit = 0
			for i in 0 ..< n { bit += (nums[i] >> j) & 1 }
			total += bit * (n - bit)
		}
		return total
	}
}

