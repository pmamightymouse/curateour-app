//
//  SignInViewController.swift
//  Curateour
//
//  Created by Maurício Linhares on 3/12/16.
//  Copyright © 2016 pmamightymouse. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController, UITextFieldDelegate {
  
  @IBOutlet weak var emailField: UITextField?
  @IBOutlet weak var passwordField: UITextField?
  @IBOutlet weak var activityIndicator: UIActivityIndicatorView?
  
  func textFieldShouldReturn( textField : UITextField) -> Bool {
    signIn(textField)
    return true;
  }
  
  @IBAction func signIn(sender: UIView) {
    
    if let email = emailField!.text, let password = passwordField!.text {
      activityIndicator!.startAnimating()
      RestClient.validateCredentials(
        email,
        password: password,
        successCallback: { result in
          
          UserDefaults.setLoggedIn(true)
          UserDefaults.setEmail(email)
          UserDefaults.setPassword(password)
          
          NSLog("Successfully logged in")
          self.activityIndicator!.stopAnimating()
          self.dismissViewControllerAnimated(true, completion: {})
        },
        errorCallback: { error in
          self.activityIndicator!.stopAnimating()
          NSLog("Failed to login")
      })
    }
    
  }
  
}
