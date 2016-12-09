//
//  Brain.swift
//  LottoFinder
//
//  Created by Xinyi Zhuang on 09/12/2016.
//  Copyright © 2016 Xinyi Zhuang. All rights reserved.
//

import UIKit

class Brain {
    private(set) var configuration : [Int] = []
    private(set) var string : String = ""
    
    public init(string: String) {
        self.string = string
        
        let len = string.characters.count
        //        print("\(len) digits number\n\n")
        let lowbound = 7
        let upperbound = 14
        if lowbound...upperbound ~= len {
            let nSingleDigit = upperbound - len
            let nDoubleDigit = len - lowbound
            
            if nDoubleDigit >= 1 {
                for _ in 1...nDoubleDigit{
                    self.configuration.append(2)
                }
            }
            
            if nSingleDigit >= 1 {
                for _ in 1...nSingleDigit{
                    self.configuration.append(1)
                }
            }
        }
    }
    
    
    class func getRandomUniqueNumbers() -> [String] {
        var array = [String]()
        while array.count != 7 {
            let num = "\(Int(arc4random_uniform(59)) + 1)"
            if !array.contains(num) {
                array.append(num)
            }
        }
        return array
    }

    
}

extension Brain {
    func anneal(inputConfig: [Int]) -> [Int] {
        
        var finalConfig = inputConfig
        let finalStrings = map(configuration: finalConfig, string: string)
        var finalCost = Brain.cost(luckyNumbers: finalStrings)


        var T = 1.0
        let T_min = 0.00001
        let alpha = 0.9
        while T > T_min {
            var i = 1
            while i <= 100 {
                let newConfig = neighbour(config: finalConfig)
                let newStrings = map(configuration: newConfig, string: string)
                let newCost = Brain.cost(luckyNumbers: newStrings)
                
                if newCost == 0 {
                    return newConfig
                }
                
                let accceptanceProbability = exp(Double(abs(newCost - finalCost)) / T)
                if accceptanceProbability > Double(arc4random_uniform(100)) / 100 {
                    finalConfig = newConfig
                    finalCost = newCost
                }
                i += 1
            }
            T *= alpha
        }
        return finalConfig

    }
    
    func map(configuration: [Int] ,string: String) -> [String] {
        assert(configuration.reduce(0, +) == string.characters.count)
        var results = [String]()
        for i in 0 ..< configuration.count {
            let currentPosition = results.joined(separator: "").characters.count
            let s = string.substring(with: currentPosition ..< currentPosition + configuration[i])
            results.append(s)
        }
        return results
    }
    
    
    
    private func neighbour(config : [Int]) -> [Int] {
        var c = config
        c.shuffle()
        return c
    }
    
    class func cost(luckyNumbers: [String]) -> Int {
        /*
         Note that a valid lottery ticket must have
         1 - 7 unique numbers
         2 - between 1 and 59,
         3 - digits must be used in order, and every digit must be used.
         */
        
        let validLength = 7
        let lowerbound = 1
        let upperbound = 59
        var score = 0 //when ever an invalid propertiy is found, 'score' goes up by 1
        
        //check valid length
        if luckyNumbers.count != validLength {
            score += 1
        }
        
        //check valid range
        for s in luckyNumbers {
            
            if s.hasPrefix("0"){
                score += 1
            }
            
            if let s_int = Int(s) {
                if s_int < lowerbound || s_int > upperbound {
                    score += 1
                }
            }else{
                score += 1
            }
        }
        
        //check if unique
        score += abs(luckyNumbers.count - Array(Set(luckyNumbers)).count)
        
        return score
    }

}

extension String {
    func index(from: Int) -> Index {
        return self.index(startIndex, offsetBy: from)
    }
    
    func substring(from: Int) -> String {
        let fromIndex = index(from: from)
        return substring(from: fromIndex)
    }
    
    func substring(to: Int) -> String {
        let toIndex = index(from: to)
        return substring(to: toIndex)
    }
    
    func substring(with r: Range<Int>) -> String {
        let startIndex = index(from: r.lowerBound)
        let endIndex = index(from: r.upperBound)
        return substring(with: startIndex..<endIndex)
    }
}

extension MutableCollection where Indices.Iterator.Element == Index {
    /// Shuffles the contents of this collection.
    mutating func shuffle() {
        let c = count
        guard c > 1 else { return }
        
        for (firstUnshuffled , unshuffledCount) in zip(indices, stride(from: c, to: 1, by: -1)) {
            let d: IndexDistance = numericCast(arc4random_uniform(numericCast(unshuffledCount)))
            guard d != 0 else { continue }
            let i = index(firstUnshuffled, offsetBy: d)
            swap(&self[firstUnshuffled], &self[i])
        }
    }
}

extension Sequence {
    /// Returns an array with the contents of this sequence, shuffled.
    func shuffled() -> [Iterator.Element] {
        var result = Array(self)
        result.shuffle()
        return result
    }
}

