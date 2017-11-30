package main

import "testing"
import "github.com/stretchr/testify/assert"

func TestFind(t *testing.T) {
	assert.Equal(t, 1, excavate([]int{1, 3, 20, 4, 1, 0}))
	assert.Equal(t, 4, excavate([]int{2, 6, 1, 6, 1, 3}))
	assert.Equal(t, 1, excavate([]int{2, 6, 6, 6, 3}))
	assert.Equal(t, 1, excavate([]int{1, 2, 3, 1}))
	assert.Equal(t, 1, excavate([]int{6, 1, 4}))
	assert.Equal(t, 1, excavate([]int{1}))
}
