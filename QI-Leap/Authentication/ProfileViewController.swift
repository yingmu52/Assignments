//
//  ProfileViewController.swift
//  Authentication
//
//  Created by Xinyi Zhuang on 16/11/2017.
//  Copyright © 2017 Xinyi Zhuang. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

  @IBOutlet weak var label: UILabel!

  override func viewDidLoad() {
    super.viewDidLoad()
    // TODO: display email into label
  }
  @IBAction func logoutPressed(_ sender: UIButton) {
    print("logout button pressed")
  }
}
