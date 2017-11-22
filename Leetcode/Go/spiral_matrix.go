package main

func generateMatrix(n int) [][]int {
	// fill 2d array with 0
	res := make([][]int, n)
	for i := range res {
		res[i] = make([]int, n)
	}

	current := 1
	i, j := 0, 0
	low := 0
	up := n - 1
	for current <= n*n {
		for ; j <= up; j++ { // left to right
			res[i][j] = current
			current++
		}
		i++                     // move down one level
		for j--; i <= up; i++ { // top to bottom
			res[i][j] = current
			current++
		}
		j--                     // move left one level
		for i--; j > low; j-- { // right to left
			res[i][j] = current
			current++
		}
		for ; i > low; i-- { // bottom to top
			res[i][j] = current
			current++
		}
		low++
		up--
		i++
		j++
	}
	return res
}
