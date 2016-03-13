//
//  MainViewController.swift
//  Curateour
//
//  Created by Maurício Linhares on 3/12/16.
//  Copyright © 2016 pmamightymouse. All rights reserved.
//

import UIKit

class MainViewController : UINavigationController {
  
  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    checkLoginStatus()
  }
  
  @objc @IBAction func signOut(button: UIButton) {
    UserDefaults.signOut()
    checkLoginStatus()
  }
  
  private func checkLoginStatus() {
    if !UserDefaults.isLoggedIn() {
      self.performSegueWithIdentifier("modal", sender: self);
    }
  }
  
}
