//
//  Brain.swift
//  LottoFinder
//
//  Created by Xinyi Zhuang on 09/12/2016.
//  Copyright © 2016 Xinyi Zhuang. All rights reserved.
//

import UIKit

class Brain {
    
    private(set) var string : String = ""
    public init(str: String) {
        self.string = str
    }
    
    //Untility function to generate a valid lotter tickets, cost is guarantee to be 0
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
    
    /**
     Simmulated Annealing Function, see https://en.wikipedia.org/wiki/Simulated_annealing
     - important: Before calling this method, a Brain instance must be initialised with 'string' property set should be initialzed
     - features:
        1. A decreasing tempreture schdedule T
        2. Evaluation of Local optimum using Brain.cost() function
        3. The configuration is updated when it generates a lower cost ticket
     - returns: a configuration array

     */
    func anneal() -> [Int]? {
        

        if let randomConfig = self.string.randomConfiguration() {
            
            //initialise configuration and evaluate its cost
            var finalConfig = randomConfig
            var finalCost = Brain.cost(numbers: self.string.luckyNumbers(for: randomConfig)!)
            
            var T = 1.0
            let T_min = 0.00001
            let alpha = 0.9
            while T > T_min {
                var i = 1
                while i <= 100 {
                    
                    //get a neighbour config
                    let tmpConfig = neighbour(config: finalConfig)
                    let tmpCost = Brain.cost(numbers: self.string.luckyNumbers(for: tmpConfig)!)
                    
                    //a valid config is found
                    if tmpCost == 0 {
                        return tmpConfig
                    }
                    
                    //move to the next state when accepted
                    let accceptanceProbability = exp(Double(abs(tmpCost - finalCost)) / T)
                    if accceptanceProbability > Double(arc4random_uniform(100)) / 100 {
                        finalConfig = tmpConfig
                        finalCost = tmpCost
                    }
                    i += 1
                }
                T *= alpha
            }
            return finalConfig

        }
        return nil
    }
    
    
    
    /*
     This function finds a neigbour configuration in Simmulated Annealing, 
     it is basicaaly a configuration re-arrangement
     */
    private func neighbour(config : [Int]) -> [Int] {
        var c = config
        c.shuffle()
        return c
    }

    
    
    
    /**
     - parameters:
        - numbers: a candidate array of numbers

     Evaluate the cost of a candidate array of numbers
     - Note that a valid lottery ticket must have
        - 7 unique numbers
        - between 1 and 59,
        - digits must be used in order, and every digit must be used.
     - the cost of a valid lottery ticket is 0, this function is used to help Simmulated Annealing method evaluate local optimum
     
     - returns: cost
     */
    class func cost(numbers: [String]) -> Int {
        
        let validLength = 7
        let lowerbound = 1
        let upperbound = 59
        var score = 0 //when ever an invalid propertiy is found, 'score' goes up by 1
        
        //check valid length
        if numbers.count != validLength {
            score += 1
        }
        
        for s in numbers {
            
            
            //0 prefix is not accecpted, i.e "01"
            if s.hasPrefix("0"){
                score += 1
            }
            
            //check if each number is in 1~59
            if let s_int = Int(s) {
                if s_int < lowerbound || s_int > upperbound {
                    score += 1
                }
            }else{
                score += 1
            }
        }
        
        //check if unique
        score += abs(numbers.count - Array(Set(numbers)).count)
        
        return score
    }

}


extension String {
    
    /* Valid Ticket Configuration
     Number of digit       configuration      numbers of 1     numbers of 2
     7                      1 1 1 1 1 1 1           14 - 7          7 - 7
     8                      2 1 1 1 1 1 1           14 - 8          8 - 7
     9                      2 2 1 1 1 1 1           14 - 9          9 - 7
     10                     2 2 2 1 1 1 1           14 - 10         10 - 7
     11                     2 2 2 2 1 1 1           14 - 11         11 - 7
     12                     2 2 2 2 2 1 1           14 - 12         12 - 7
     13                     2 2 2 2 2 2 1           14 - 13         13 - 7
     14                     2 2 2 2 2 2 2           14 - 14         14 - 7
     */
    
    func isValid(configuration: [Int]) -> Bool {
        //as indicated above, the sum of configuration elements euqals the length of a valid ticket
        return configuration.reduce(0, +) == self.characters.count
    }

    
    func randomConfiguration() -> [Int]?{
        //generate a random valid configuration with consists only 1 / 2
        
        let len = self.characters.count
        
        //valid ticket string must have length within 7 ~ 14 digits
        let lowbound = 7
        let upperbound = 14
        
        
        if lowbound...upperbound ~= len {
            var config = [Int]()
            
            let nSingleDigit = upperbound - len
            let nDoubleDigit = len - lowbound
            
            
            //append 2
            if nDoubleDigit >= 1 {
                for _ in 1...nDoubleDigit{
                    config.append(2)
                }
            }
            
            //append 1
            if nSingleDigit >= 1 {
                for _ in 1...nSingleDigit{
                    config.append(1)
                }
            }
            return config
        }
        return nil
    }

    
    /**
     generate a lucky numbers based on configuration,
     i.e.  "12345678" (string),  [1,1,1,1,1,1,2] (configuration) => ["1","2","3","4","5","6","78"]
     - returns: An array of lucky numbers
     */
    func luckyNumbers(for configuration: [Int]) -> [String]? {
        /* 
         
         */
        if isValid(configuration: configuration) {
            var results = [String]()
            for i in 0 ..< configuration.count {
                let currentPosition = results.joined(separator: "").characters.count
                let s = self.substring(with: currentPosition ..< currentPosition + configuration[i])
                results.append(s)
            }
            return results
        }
        return nil
    }
    
}


extension String { //ultility function to get substrings
    func index(from: Int) -> Index {
        return self.index(startIndex, offsetBy: from)
    }
    
    func substring(from: Int) -> String {
        let fromIndex = index(from: from)
        return substring(from: fromIndex)
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
