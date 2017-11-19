package main

// https://leetcode.com/problems/rotate-function/description/

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
		if F > max {
			max = F
		}
	}
	return max
}
