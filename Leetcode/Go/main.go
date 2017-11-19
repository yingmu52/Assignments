package main

import "fmt"

func main() {
	fmt.Println("OK")
}

func max(a, b int) int {
	if a > b {
		return a
	}
	return b
}
