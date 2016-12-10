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
        searchButton.isEnabled = false
        
        
        //generate random data and find out the lucky numbers
        DispatchQueue.global().async {
            let randomStrings = self.generateInputStrings()
            for string in randomStrings {
                
                //find lucky number using Simulate Annealing
                guard let configs = Brain(str: string).anneal(),
                    let candiateNumbers = string.luckyNumbers(for: configs),
                    Brain.cost(numbers: candiateNumbers) == 0 else
                {
                        //Update TextView for invalid numbers
                        DispatchQueue.main.async {
                            self.textView.appendNormalText(text: "\(string) - No Luck\n")
                        }
                        continue;
                }
                
                //Update TextView for found lucky numbers
                DispatchQueue.main.async {
                    if Brain.cost(numbers: candiateNumbers) == 0 {
                        self.textView.appendLuckyText(text: "\(string) -> \(candiateNumbers.joined(separator: " "))\n")
                    }

                }
            }
            DispatchQueue.main.async {
                self.searchButton.isEnabled = true
            }
        }
        

        
}
    
    func generateInputStrings() -> [String] {
        let nElements = 30
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

extension UITextView {
    func  appendNormalText(text: String){
        let attributes = [NSForegroundColorAttributeName:UIColor.lightGray,
                          NSFontAttributeName:UIFont.systemFont(ofSize: 13)]

        let current = self.attributedText.mutableCopy() as! NSMutableAttributedString
        current.append(NSAttributedString(string: text, attributes: attributes))
        self.attributedText = current
    }
    
    func appendLuckyText(text: String){
        let attributes = [NSForegroundColorAttributeName:UIColor.red,
                          NSFontAttributeName:UIFont.systemFont(ofSize: 15)]
        
        let current = self.attributedText.mutableCopy() as! NSMutableAttributedString
        current.append(NSAttributedString(string: text, attributes: attributes))
        self.attributedText = current
        
    }
}

