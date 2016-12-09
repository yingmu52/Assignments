//
//  ViewController.swift
//  LottoFinder
//
//  Created by Xinyi Zhuang on 07/12/2016.
//  Copyright © 2016 Xinyi Zhuang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    @IBAction func searchPressed() {
        //clear textview's text
        textView.text = "Input Strings: \n"
        let s = generateInputStrings()
        for s1 in s {
            textView.text.append("\"" + s1 + "\"")
            textView.text.append("\n")
        }
}
    
    func generateInputStrings() -> Array<String> {
        let nElements = 5
        var output = [String]()
        for _ in 1...nElements {
            let nDigit = Int(arc4random_uniform(14)) + 1 //1~14
            var tmp = ""
            for _ in 1...nDigit {
                let singleDigit = Int(arc4random_uniform(10)) //0~9
                tmp.append(String(singleDigit))
            }
            output.append(tmp)
        }
        return output
    }
    
    func evaluation(luckyNumbers: Array<String>) -> Int {
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



