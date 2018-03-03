package main

import "math"

func findDisappearedNumbers(nums []int) []int {
	result := []int{}
	// mark as many numbers to negative as much as possible
	for _, value := range nums {
		nums[abs(value)-1] = -abs(nums[abs(value)-1])
	}
	// find position and get the index
	for index, value := range nums {
		if value > 0 { 
			result = append(result, index + 1)
		}
	}
	return result
}

func abs(val int) int {
	return int(math.Abs(float64(val)))
}
