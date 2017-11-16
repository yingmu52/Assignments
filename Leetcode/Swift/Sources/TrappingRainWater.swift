import Foundation

class TrappingRainWater {

    func trap(_ height: [Int]) -> Int {
        if height.count < 3 { return 0 }
        var total = 0
        // insert 1 
        let (begin, end)  = getBoundary(height)
        if begin >= end { return 0 }

        for ind in begin...end {
            if height[ind] == 0 {
                total = total + 1
            }
        }
        return total + trap(next(height))
    }

    func getBoundary(_ height: [Int]) -> (Int, Int) {
        var leftIndex = -1 
        var rightindex = -1
        for i in 0...height.count-1 {
            if height[i] != 0 { 
                leftIndex = i
                break
            }
        }
        for i in stride(from: height.count-1, through: 0, by: -1) {
            if height[i] != 0 { 
                rightindex = i
                break
            }
        }
        return (leftIndex,rightindex)
    }

    func next(_ height: [Int]) -> [Int] {
        var array = height
        for (index,value) in array.enumerated() {
            let val = value - 1
            array[index] = val < 0 ? 0 : val
        }
        return array
    }


    // two pointer 
    func solution(_ height: [Int]) -> Int {
        var (leftIndex, leftMax, rightMax, total, rightIndex) = (0, 0, 0, 0, height.count - 1)
        while leftIndex <= rightIndex {
            if height[leftIndex] <= height[rightIndex] {
                height[leftIndex] > leftMax ? (leftMax = height[leftIndex]) : (total = total + leftMax - height[leftIndex])
                leftIndex = leftIndex + 1
            }else{
                height[rightIndex] > rightMax ? (rightMax = height[rightIndex]) : (total = total + rightMax - height[rightIndex])
                rightIndex = rightIndex - 1
            }
        }
        return total
    }
}
