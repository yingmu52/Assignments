package main

//https://leetcode.com/problems/longest-continuous-increasing-subsequence/description/

func findLengthOfLCIS(nums []int) int {
	if len(nums) == 0 {
		return 0
	}
	stack := []int{nums[0]}
	count := 1
	for i := 0; i < len(nums); i++ {
		if nums[i] > stack[len(stack)-1] {
			stack = append(stack, nums[i])
		} else {
			stack = []int{nums[i]}
		}
		if len(stack) > count {
			count = len(stack)
		}
	}
	return count
}
