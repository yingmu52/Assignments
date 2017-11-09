package main

func main() {}

func excavate(land []int) int {
	landSize := len(land)
	if landSize <= 1 {
		return 1 // ???
	}

	// transform
	array := []int{}
	for i := 1; i < landSize; i++ {
		sgnValue := sign(land[i] - land[i-1])
		if sgnValue != 0 {
			array = append(array, sgnValue)
		}
	}

	// collect peaks and valleys
	castles := 0
	for j := 0; j <= len(array)-2; j++ {
		if array[j]*array[j+1] < 0 {
			castles++
		}
	}
	return castles
}

func sign(a int) int {
	switch {
	case a < 0:
		return -1
	case a > 0:
		return +1
	}
	return 0
}
