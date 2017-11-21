package main

func islandPerimeter(grid [][]int) int {
	res := 0
	for i, col := range grid {
		for j, row := range col {
			if row != 1 {
				continue
			}
			res += 4
			if i-1 >= 0 && grid[i-1][j] == 1 {
				res--
			}
			if i+1 < len(grid) && grid[i+1][j] == 1 {
				res--
			}
			if j-1 >= 0 && grid[i][j-1] == 1 {
				res--
			}
			if j+1 < len(col) && grid[i][j+1] == 1 {
				res--
			}
		}
	}
	return res
}
