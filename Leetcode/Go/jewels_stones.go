package main

func numJewelsInStones(J string, S string) int {
	result, jewelBook := 0, map[rune]int{}
	for _, letter := range J { jewelBook[letter] = 1 }
	for _, s := range S { result += jewelBook[s] }
	return result
}

