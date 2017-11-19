package main

type MinStack struct {
	storage    []int
	minHistory []int
}

/** initialize your data structure here. */
func Constructor() MinStack {
	stack := MinStack{}
	stack.storage = []int{}
	stack.minHistory = []int{}
	return stack
}

func (this *MinStack) Push(x int) {
	l := len(this.minHistory)
	if l == 0 || x <= this.minHistory[l-1] {
		this.minHistory = append(this.minHistory, x)
	}
	this.storage = append(this.storage, x)
}

func (this *MinStack) Pop() {
	if this.Top() == this.GetMin() {
		this.minHistory = this.minHistory[:len(this.minHistory)-1]
	}
	l := len(this.storage)
	this.storage = this.storage[:l-1]
}

func (this *MinStack) Top() int {
	return this.storage[len(this.storage)-1]
}

func (this *MinStack) GetMin() int {
	l := len(this.minHistory)
	return this.minHistory[l-1]
}
