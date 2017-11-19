package main

func findLHS(nums []int) int {
	memo := map[int]int{}
	for _, val := range nums {
		if cache, ok := memo[val]; ok {
			memo[val] = cache + 1
		} else {
			memo[val] = 1
		}
	}
	count := 0
	for _, val := range nums {
		// number of min + number of max
		c1, ok1 := memo[val]
		c2, ok2 := memo[val+1]
		if ok1 && ok2 && c1+c2 > count {
			count = c1 + c2
		}
	}
	return count
}
