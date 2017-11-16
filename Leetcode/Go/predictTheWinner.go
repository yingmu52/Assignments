package main

import "fmt"

func main() {
	//https://leetcode.com/problems/predict-the-winner/description/
	fmt.Println(predictTheWinner([]int{1, 5, 2}), false)
	fmt.Println(predictTheWinner([]int{1, 5, 233, 7}), true)
}

// return true if player 1 can win
func predictTheWinner(nums []int) bool {
	return pick(nums, 0, len(nums)-1, map[string]int{}) >= 0
}

func pick(nums []int, l int, r int, memo map[string]int) int {
	if l == r {
		return nums[l]
	}
	if val, ok := memo[string(l)+string(r)]; ok {
		return val
	}
	// finding maximum effective pick
	a := nums[l] - pick(nums, l+1, r, memo)
	b := nums[r] - pick(nums, l, r-1, memo)
	m := max(a, b)
	memo[string(l)+string(r)] = m
	return m
}

func max(a, b int) int {
	if a > b {
		return a
	}
	return b
}
