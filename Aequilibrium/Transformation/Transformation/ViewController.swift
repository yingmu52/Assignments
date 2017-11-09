//
//  ViewController.swift
//  Transformation
//
//  Created by Xinyi Zhuang on 08/11/2017.
//  Copyright © 2017 Xinyi Zhuang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var textView: UITextView!

  @IBAction func play() {
    self.textView.text = nil
    self.textView.text.append("Input\n\n")
    let (autobots, deceptions) = TransformerData.randomeData()
    self.textView.text.append((autobots + deceptions)
      .map { $0.description }
      .joined(separator: "\n") + "\n\n")
    self.textView.text.append("Output\n\n")
    self.textView.text.append(autobots.battle(deceptions))
  }
}
