package main

func twoSum(nums []int, target int) []int {
	memo := map[int]int{} // index: number
	res := []int{}
	for index, num := range nums {
		memo[num] = index
	}
	for index, num := range nums {
		if index1, ok := memo[target-num]; ok && index != index1 {
			res = append(res, index, index1)
			break
		}
	}
	return res
}
