//
//  RestClient.swift
//  Curateour
//
//  Created by Maurício Linhares on 3/12/16.
//  Copyright © 2016 pmamightymouse. All rights reserved.
//

import Foundation
import Alamofire

class RestClient {

  static func buildUrl( path : String ) -> String {
    return "http://localhost:3000/\(path).json"
  }
  
  static func validateCredentials(
    email: String,
    password: String,
    successCallback: Void -> Void,
    failureCallback: Void -> Void
    ) {
      
    let parameters = [
      "user" : [
        "email" : email,
        "password" : password
      ]
    ]
    
    Alamofire.request( .POST,
      buildUrl("api/v1/session"),
      parameters: parameters).responseJSON { response in
        if let error = response.result.error {
          NSLog("failed to load the data from heroku - %@", error.localizedDescription)
          dispatch_async(dispatch_get_main_queue(),{
            failureCallback()
          })
        } else if let value = response.result.value {
          NSLog("Received ok response from server - \(value)")
          dispatch_async(dispatch_get_main_queue(),{
            successCallback()
          })
        } else {
          NSLog("Response was not a result nor an error")
        }
    }
    
    
  }
  
}
