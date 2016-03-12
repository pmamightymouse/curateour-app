//
//  UserDefaults.swift
//  Curateour
//
//  Created by Maurício Linhares on 3/12/16.
//  Copyright © 2016 pmamightymouse. All rights reserved.
//

import Foundation

class UserDefaults {
  
  private static let IsLoggedIn = "isLoggedIn"
  private static let Email = "email"
  private static let Password = "password"
  
  private static func defaults() -> NSUserDefaults {
    return NSUserDefaults.standardUserDefaults()
  }
  
  static func signOut() {
    clearKeys(IsLoggedIn, Email, Password)
  }
  
  static func clearKeys(keys: String...) {
    for key in keys {
      defaults().removeObjectForKey(key)
    }
  }
  
  static func isLoggedIn() -> Bool {
    return defaults().boolForKey(IsLoggedIn)
  }
  
  static func setLoggedIn(loggedIn: Bool) {
    defaults().setBool(loggedIn, forKey: IsLoggedIn)
  }
  
  static func setPassword(password: String) {
    defaults().setValue(password, forKey: Password)
  }
  
  static func getPassword() -> String? {
    return defaults().objectForKey(Password) as? String
  }

  static func setEmail(email: String) {
    defaults().setValue(email, forKey: Email)
  }
  
  static func getEmail() -> String? {
    return defaults().objectForKey(Email) as? String
  }
  
  
}