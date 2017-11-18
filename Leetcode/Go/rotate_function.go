package main

import (
	"fmt"
)

// https://leetcode.com/problems/rotate-function/description/

func main() {
	fmt.Println("ok")
	fmt.Println(maxRotateFunction([]int{4, 3, 2, 6}), 26)
	fmt.Println(maxRotateFunction([]int{1, 2, 3, 4, 5, 6, 7, 8, 9, 10}), 330)
}

// F(k) = F(k-1) + sum - nBk[0]
func maxRotateFunction(A []int) int {
	sum := 0
	F := 0
	for i := 0; i < len(A); i++ {
		F += A[i] * i
		sum += A[i]
	}
	max := F
	for i := len(A) - 1; i >= 0; i-- {
		F = F + sum - len(A)*A[i]
		fmt.Println(F)
		if F > max {
			max = F
		}
	}
	return max
}
