package main

import (
	"testing"

	"github.com/stretchr/testify/assert"
)

func TestLongestRepeatLetter(t *testing.T) {
	assert.Equal(t, longestPalindromeSubseq("bbbab"), 4)
	assert.Equal(t, longestPalindromeSubseq("cbbd"), 2)
	assert.Equal(t, longestPalindromeSubseq("aabaa"), 5)
}

func TestMaxProfit(t *testing.T) {
	assert.Equal(t, maxProfit([]int{1, 3, 2, 8, 4, 9}, 2), 8)
	assert.Equal(t, maxProfit([]int{3, 1, 1, 1, 1, 1, 1, 1, 100, 1, 1}, 0), 99)
}

func TestPredictWinner(t *testing.T) {
	assert.Equal(t, predictTheWinner([]int{1, 5, 2}), false)
	assert.Equal(t, predictTheWinner([]int{1, 5, 233, 7}), true)
}

func TestRotateFunction(t *testing.T) {
	assert.Equal(t, maxRotateFunction([]int{4, 3, 2, 6}), 26)
	assert.Equal(t, maxRotateFunction([]int{1, 2, 3, 4, 5, 6, 7, 8, 9, 10}), 330)
}

func TestThirdMaxNum(t *testing.T) {
	assert.Equal(t, thirdMax([]int{1, 2, 3}), 1)
	assert.Equal(t, thirdMax([]int{2, 2, 3, 1}), 1)
}

func TestLongestCIS(t *testing.T) {
	assert.Equal(t, 3, findLengthOfLCIS([]int{1, 3, 5, 4, 7}))
	assert.Equal(t, 1, findLengthOfLCIS([]int{2, 2, 2, 2, 2}))
	assert.Equal(t, 4, findLengthOfLCIS([]int{1, 3, 5, 7}))
}

func TestMinStack(t *testing.T) {
	// ["MinStack","push","push","push","getMin","pop","top","getMin"]
	stack := Constructor()
	stack.Push(-2)
	stack.Push(0)
	stack.Push(-3)
	assert.Equal(t, -3, stack.GetMin())
	stack.Pop()
	assert.Equal(t, 0, stack.Top())
	assert.Equal(t, -2, stack.GetMin())
}

func TestValidParentheses(t *testing.T) {
	assert.Equal(t, true, isValid("()[]{}"))
	assert.Equal(t, false, isValid("([)"))
}

func TestLHS(t *testing.T) {
	assert.Equal(t, 5, findLHS([]int{1, 3, 2, 2, 5, 2, 3, 7}))
}

func TestMaxAverageSubarray(t *testing.T) {
	assert.Equal(t, 12.75, findMaxAverage([]int{1, 12, -5, -6, 50, 3}, 4))
	assert.Equal(t, float64(4), findMaxAverage([]int{0, 4, 0, 3, 2}, 1))
}

func TestMinIndexSumTwoArray(t *testing.T) {
	inst1 := findRestaurant(
		[]string{"Shogun", "Tapioca Express", "Burger King", "KFC"},
		[]string{"KFC", "Shogun", "Burger King"},
	)
	assert.Equal(t, []string{"Shogun"}, inst1)

	inst2 := findRestaurant(
		[]string{"Shogun", "Tapioca Express", "Burger King", "KFC"},
		[]string{"Piatti", "The Grill at Torrey Pines", "Hungry Hunter Steakhouse", "Shogun"},
	)
	assert.Equal(t, []string{"Shogun"}, inst2)
}
