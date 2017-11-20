//
//  ViewController.swift
//  Authentication
//
//  Created by Xinyi Zhuang on 16/11/2017.
//  Copyright © 2017 Xinyi Zhuang. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

  @IBOutlet weak var switchControl: UISwitch!
  @IBOutlet weak var button: UIButton!
  @IBOutlet weak var passwordTextField: UITextField!
  @IBOutlet weak var emailTextField: UITextField!

  override func viewDidLoad() {
    super.viewDidLoad()
    self.emailTextField.becomeFirstResponder()
  }
  
  @IBAction func toggleSwitch(_ sender: UISwitch) {
    let title = sender.isOn ? "Signup" : "Login"
    self.button.setTitle(title, for: .normal)
  }

  @IBAction func buttonPressed(_ sender: UIButton) {
    guard
      let e = self.emailTextField.text,
      let p = self.passwordTextField.text,
      e.isEmpty == false,
      p.isEmpty == false else {
        self.showText("The email or password field must not be empty")
        return
    }
    if self.switchControl.isOn {
      Service.signup(email: e, pass: p) { desc, success in
        if success {
          self.showText("Signup successful")
          self.switchControl.setOn(false, animated: true)
          self.toggleSwitch(self.switchControl)
        } else {
          self.showText(desc)
        }
      }
    } else {
      Service.login(email: e, pass: p) { desc, success in
        if success {
          // TODO: segue to ProfileVC
          self.showText("Login successful")
        } else {
          self.showText(desc)
        }
      }
    }
  }
}

extension ViewController {
  func showText(_ text: String, action: @escaping () -> Void = {}) {
    let alert = UIAlertController(title: "Result", message: text, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
      action()
    }))
    self.show(alert, sender: nil)
  }
}
