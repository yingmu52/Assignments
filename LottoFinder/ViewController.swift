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
    @IBOutlet weak var searchButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        searchButton.setTitle("Searching...", for: .disabled)
    }
    
    @IBAction func searchPressed() {
        //clear textview's text
        textView.text = ""

        
        let randomStrings = generateInputStrings()
        searchButton.isEnabled = false
        
        DispatchQueue.global().async {
            for string in randomStrings {
                if let configs = Brain(str: string).anneal() {
                    if let candiateNumbers = string.luckyNumbers(for: configs) {
                        //update UI
                        DispatchQueue.main.async {
                            if Brain.cost(numbers: candiateNumbers) == 0 {
                                self.textView.text.append("\(candiateNumbers) - LUCKY!!")
                                self.textView.text.append("\n")
                            }else{
                                self.textView.text.append("\(string) - No Luck\n")
                            }
                        }
                    }else{
                        DispatchQueue.main.async {
                            self.textView.text.append("\(string) - No Luck\n")
                        }
                    }
                }else{
                    DispatchQueue.main.async {
                        self.textView.text.append("\(string) - No Luck\n")
                    }
                }
            }
            DispatchQueue.main.async {
                self.searchButton.isEnabled = true
            }
        }
        

        
}
    
    func generateInputStrings() -> [String] {
        let nElements = 20
        var output = [String]()
        for _ in 1...nElements {
            let nDigit = Int(arc4random_uniform(18)) + 1 //1~20   only [7~14] is in valid range
            var tmp = ""
            for _ in 1...nDigit {
                let singleDigit = Int(arc4random_uniform(10)) //0~9
                tmp.append(String(singleDigit))
            }
            output.append(tmp)
        }
        return output
    }
    

}

