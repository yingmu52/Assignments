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
    
    func testBrain() {
        for _ in 1...100 {
            let uniqueNums = Brain.getRandomUniqueNumbers()
            let inputString = uniqueNums.joined(separator: "")
            let brain = Brain(string: inputString)
            var sum = 0
            for n in brain.configuration {
                sum += n
            }
            print(uniqueNums)
            print(brain.configuration)
            assert(sum == inputString.characters.count)
            assert(uniqueNums.count == brain.configuration.count)
            

            assert(Brain.cost(luckyNumbers: uniqueNums) == 0)
         
            
            let mappedResult = brain.map(configuration: brain.configuration, string: inputString)
            assert(mappedResult.count == brain.configuration.count)
            
            for i in 0 ..< mappedResult.count {
                assert(mappedResult[i].characters.count == brain.configuration[i])
            }
            
        }
    }
    
    func testAnnealing(){
        
        //example test
        let in1 = "1234567"
        let b1 = Brain(string: in1)
        let out1 = b1.anneal(inputConfig: b1.configuration)
        let cost1 = Brain.cost(luckyNumbers: b1.map(configuration: out1, string: in1))
        
        let in2 = "4938532894754"
        let b2 = Brain(string: in2)
        let out2 = b2.anneal(inputConfig: b2.configuration)
        let cost2 = Brain.cost(luckyNumbers: b2.map(configuration: out2, string: in2))
        assert(cost1 == 0 && cost2 == 0)
        
        
        
        //pressure test
        var successCount = 0
        let iterations = 10000
        for _ in 1...iterations {
            let uniqueNums = Brain.getRandomUniqueNumbers()
            let inputString = uniqueNums.joined(separator: "")
            let brain = Brain(string: inputString)
            let outputConfiguration = brain.anneal(inputConfig: brain.configuration)
            
            let outputStrings = brain.map(configuration: outputConfiguration, string: inputString)
            
            if Brain.cost(luckyNumbers: outputStrings) == 0 {
                print("Successed")
                successCount += 1
            }else{
                print("Failed")
            }
//            print("\(inputString) -> \(outputStrings)")
        }
        
        let errorRate = Double(iterations - successCount) / Double(iterations)
        
        print("Error Rate : \(errorRate)")
    }
    
}
