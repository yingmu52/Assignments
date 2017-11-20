package main

func findMaxAverage(nums []int, k int) float64 {
	sum := 0
	for i := 0; i < k; i++ {
		sum += nums[i]
	}
	res := sum
	for ind := 0; ind+k < len(nums); ind++ {
		sum += nums[ind+k] - nums[ind]
		if sum > res {
			res = sum
		}
	}
	return float64(res) / float64(k)
}
