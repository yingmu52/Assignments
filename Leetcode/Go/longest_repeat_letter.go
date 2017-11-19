package main

// https://leetcode.com/problems/longest-palindromic-subsequence/description/

func longestPalindromeSubseq(s string) int {
	memo := map[string]int{} // index i, j : count
	return lps(s, 0, len(s)-1, memo)
}

func lps(s string, i, j int, memo map[string]int) int {

	// check memo
	if val, ok := memo[string(i)+string(j)]; ok {
		return val
	}

	if i == j { // case 1: only 1 char
		return 1
	}
	if i+1 == j && s[i] == s[j] { // case 2: two char
		return 2
	}

	result := 0
	if s[i] == s[j] { // look at next inner string
		result = lps(s, i+1, j-1, memo) + 2 // 2 means including s[i] and s[j]
	} else {
		result = max(lps(s, i+1, j, memo), lps(s, i, j-1, memo))
	}
	memo[string(i)+string(j)] = result
	return result
}
