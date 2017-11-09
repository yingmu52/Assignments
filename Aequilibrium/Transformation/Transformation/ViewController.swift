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

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  @IBAction func play() {
    self.textView.text = nil
    // pick n from autobots, k from deceptions and battle!
    let n = self.randomInt(max: 20)
    let k = self.randomInt(max: 20)
    var autobots = [Transformer]()
    var decepticons = [Transformer]()

    for _ in 1...n {
      let index = self.randomInt(max: TransformerData.autobots.count - 1)
      let data = TransformerData.autobots[index]
      if let t = Transformer(data.0, data.1) { autobots += [t] }
    }
    for _ in 1...k {
      let index = self.randomInt(max: TransformerData.deceptions.count - 1)
      let data = TransformerData.deceptions[index]
      if let t = Transformer(data.0, data.1) { decepticons += [t] }
    }
    // fight
    let result = autobots.battle(opponents: decepticons)
    self.textView.text.append(String(describing: result.1.map { $0.name }))
    self.textView.text.append("\n###\n")
    self.textView.text.append(String(describing: result.2.map {$0.name }))
  }

  func randomInt(max: Int) -> Int { // 1...max
    return Int(arc4random_uniform(UInt32(max))) + 1
  }
}
