//
//  LottoFinderTests.swift
//  LottoFinderTests
//
//  Created by Xinyi Zhuang on 08/12/2016.
//  Copyright © 2016 Xinyi Zhuang. All rights reserved.
//

import XCTest

class LottoFinderTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testEvaluationFunction(){
        
        //test unique 
        for _ in 1 ... 100 {
            let uniqueRandomNumbers = getRandomUniqueNumbers()
            assert(ViewController.evaluation(luckyNumbers: uniqueRandomNumbers) == 0)
        }
    }
    
    func getRandomUniqueNumbers() -> Array<String> {
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
