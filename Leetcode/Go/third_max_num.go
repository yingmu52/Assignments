package main

import (
	"fmt"
)

func main() {
	fmt.Println(thirdMax([]int{1, 2, 3}), 1)
	fmt.Println(thirdMax([]int{2, 2, 3, 1}), 1)
}

func thirdMax(nums []int) int {
	nums = createSet(nums)
	fmt.Println(nums)
	if len(nums) >= 3 {
		for range []int{1, 2} {
			_, ind := maxIn(nums)
			nums = removeAtIndex(nums, ind)
		}
	}
	res, _ := maxIn(nums)
	return res
}

func maxIn(nums []int) (int, int) {
	res := nums[0]
	index := 0
	for ind, val := range nums {
		if val > res {
			res = val
			index = ind
		}
	}
	return res, index
}

func createSet(nums []int) []int {
	res := []int{}
	memo := map[int]bool{}
	for _, val := range nums {
		if _, ok := memo[val]; !ok {
			res = append(res, val)
			memo[val] = true
		}
	}
	return res
}

// when calling a function, ... does the opposite:
// it unpacks a slice and passes them as separate arguments to a variadic function.
func removeAtIndex(nums []int, index int) []int {
	return append(nums[:index], nums[index+1:]...)
}
