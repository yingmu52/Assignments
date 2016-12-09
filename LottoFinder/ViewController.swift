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
    
    func generateInputStrings() -> [String] {
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
    

}

