package main

import "sort"

func maximumProduct(nums []int) int {
	sort.Slice(nums, func(i, j int) bool {
		return nums[i] < nums[j]
	})
	n := len(nums)
	a := nums[n-1] * nums[n-2] * nums[n-3]
	b := nums[0] * nums[1] * nums[n-1]
	if a > b {
		return a
	}
	return b
}
