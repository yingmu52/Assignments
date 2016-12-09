//
//  BrainTests.swift
//  LottoFinder
//
//  Created by Xinyi Zhuang on 09/12/2016.
//  Copyright © 2016 Xinyi Zhuang. All rights reserved.
//

import XCTest

class BrainTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    func testAnnealing(){
        
        //example test
        let in1 = "1234567"
        let b1 = Brain(str: in1)
        let out1 = b1.anneal()
        let cost1 = Brain.cost(numbers:in1.luckyNumbers(for: out1!)!)
        
        let in2 = "4938532894754"
        let b2 = Brain(str: in2)
        let out2 = b2.anneal()
        let cost2 = Brain.cost(numbers:in2.luckyNumbers(for: out2!)!)
        assert(cost1 == 0 && cost2 == 0)
        print("\(in1) -> \(in1.luckyNumbers(for: out1!)!)")
        print("\(in2) -> \(in2.luckyNumbers(for: out2!)!) \n")
        
        //pressure test
        var successCount = 0
        let iterations = 100000
        for _ in 1...iterations {
            let uniqueNums = Brain.getRandomUniqueNumbers()
            let inputString = uniqueNums.joined(separator: "")
            let brain = Brain(str: inputString)
            let outputConfiguration = brain.anneal()
            let outputStrings = inputString.luckyNumbers(for: outputConfiguration!)!

            if Brain.cost(numbers: outputStrings) == 0 {
//                print("Successed")
                successCount += 1
            }else{
//                print("Failed")
            }
//            print("\(inputString) -> \(outputStrings) \n")

        }
        
        let errorRate = Double(iterations - successCount) / Double(iterations)
        
        print("Error Rate : \(errorRate)")
    }
    
}
