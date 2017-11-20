package main

func findRestaurant(list1 []string, list2 []string) []string {
	dict1 := populate(list1)
	stack := []string{}
	sum := len(list1) * len(list2)
	for i := 0; i < len(list2); i++ {
		key := list2[i]
		if j, ok := dict1[key]; ok && i+j <= sum {
			if i+j < sum {
				stack = []string{}
				sum = i + j
			}
			stack = append(stack, key)
		}
	}
	return stack
}

func populate(list []string) map[string]int {
	dict := map[string]int{}
	for index, s := range list {
		dict[s] = index
	}
	return dict
}
