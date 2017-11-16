import Foundation

class SearchInsertPosition {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        
        for (ind,num) in nums.enumerated() {
            if num >= target {
                return ind
            }
        }
        return nums.count

    }

    func binarySearch(_ nums: [Int], _ target: Int) -> Int {
        return binarySearch(nums,target,0,nums.count)
    }
    
    func binarySearch(_ nums: [Int], _ target: Int, _ lowerBound: Int, _ upperBound: Int ) -> Int {

        let midIndex = lowerBound + (upperBound - lowerBound) / 2 

        if lowerBound >= upperBound {
            return midIndex
        }else{

            if nums[midIndex] > target {
                return binarySearch(nums, target, lowerBound, midIndex)
            }else if nums[midIndex] < target {
                return binarySearch(nums,target, midIndex + 1, upperBound)
            }else{
                return midIndex
            }

        }
    }
}



/*



// test cases : Linar Search
let testArray1 = [1,3,5,6]
let s = SearchInsertPosition()

print("Linear Search")
print(s.searchInsert(testArray1,5))
print(s.searchInsert(testArray1,2))
print(s.searchInsert(testArray1,7))
print(s.searchInsert(testArray1,0))

print("Binary Search")
// test cases: Binary Search
print(s.binarySearch(testArray1,5))
print(s.binarySearch(testArray1,2))
print(s.binarySearch(testArray1,7))
print(s.binarySearch(testArray1,0))

// speed test
let testArray = Array(0...1000000)
let target = 99999

Util.getRunTime("Binary Search", codeBlock: {
	let _ = s.binarySearch(testArray,target)
})

Util.getRunTime("Linar Search", codeBlock: {
	let _ = s.searchInsert(testArray,target)
})



*/