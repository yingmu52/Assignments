package main

func isValid(s string) bool {
	stack := []string{}
	for _, val := range s {
		c := string(val)
		if c == "(" || c == "[" || c == "{" {
			stack = append(stack, c)
		} else {
			if len(stack) == 0 {
				return false
			}
			last := stack[len(stack)-1]
			p := string(last) + string(c)
			if p == "()" || p == "[]" || p == "{}" {
				stack = stack[:len(stack)-1]
			} else {
				return false
			}
		}
	}
	return len(stack) == 0
}
