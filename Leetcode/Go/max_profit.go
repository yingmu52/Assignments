package main

import (
	"fmt"
)

func main() {
	fmt.Println(maxProfit([]int{1, 3, 2, 8, 4, 9}, 2), 8)
	fmt.Println(maxProfit([]int{3, 1, 1, 1, 1, 1, 1, 1, 100, 1, 1}, 0), 99)
}

// https://leetcode.com/problems/best-time-to-buy-and-sell-stock-with-transaction-fee/description/
func maxProfit(prices []int, fee int) int {
	max := func(a, b int) int {
		if a > b {
			return a
		}
		return b
	}
	cash := 0                // the maximum profit we could have if we did not have a share of stock
	hold := cash - prices[0] // the maximum profit we could have if we owned a share of stock
	for i := 1; i < len(prices); i++ {
		cash = max(cash, hold+prices[i]-fee)
		hold = max(hold, cash-prices[i])
		fmt.Println(i, cash, hold)
	}
	fmt.Println("end")
	return cash
}

// cash has been updated before hold = max(hold, cash - prices[i]).
// But luckily if cash comes from the previous cash, it's fine.
// If cash is from hold + prices[i] - fee, then in hold = max(hold, cash - prices[i]),
// cash - prices[i] equals hold + prices[i] - fee - prices[i] which equals hold - fee,
// which is always smaller than hold, leading to a correct result. This is tricky and misleading.
// It would be better to use preCash and preHold.
