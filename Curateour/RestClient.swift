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
  
  static func listTours(
    email : String?,
    password: String?,
    successCallback: [Tour] -> Void,
    errorCallback: NSError -> Void
    ) {
      
      NSLog("Listing tours")
      
      Alamofire.request( .GET,
        buildUrl("api/v1/tours"),
        encoding: .JSON
        )
        .authenticate(user: email ?? "", password: password ?? "")
        .responseJSON(
          completionHandler: handleResponse(
            {
              result in
              
              var tours = [Tour]()
              
              for (_,subJson):(String, JSON) in result {
                if let tour = Tour.fromJSON(subJson) {
                  tours.append(tour)
                }
              }
              
              successCallback(tours)
            },
            errorCallback: errorCallback))
      
      
  }
  
  static func createTour(
    name : String,
    email: String?,
    password: String?,
    successCallback: Tour? -> Void,
    errorCallback: NSError -> Void ) {
      
      let parameters = [
        "tour": [
          "name" : name
        ]
      ]
      
      Alamofire.request( .POST,
        buildUrl("api/v1/tours"),
        parameters: parameters,
        encoding: .JSON
        )
        .authenticate(user: email ?? "", password: password ?? "")
        .responseJSON(
          completionHandler: handleResponse(
            {
              result in
              successCallback(Tour.fromJSON(result))
            },
            errorCallback: errorCallback))
  }
  
  static func createStop() {
    
  }
  
  static func validateCredentials(
    email: String,
    password: String,
    successCallback: JSON -> Void,
    errorCallback: NSError -> Void
    ) {
      
      let parameters = [
        "user" : [
          "email" : email,
          "password" : password
        ]
      ]
      
      Alamofire.request( .POST,
        buildUrl("api/v1/session"),
        encoding: .JSON,
        parameters: parameters).responseJSON(
          completionHandler: handleResponse(
            successCallback,
            errorCallback: errorCallback))
  }
  
  static func handleResponse(
    successCallback: JSON -> Void,
    errorCallback: NSError -> Void) -> Response<AnyObject, NSError> -> Void {
      
      return {
        response in
        if let error = response.result.error {
          NSLog("Failed to process request: \(error.localizedDescription)")
          dispatch_async(dispatch_get_main_queue(),{
            errorCallback(error)
          })
        } else if let value = response.result.value {
          NSLog("Correctly processed response: \(value)")
          dispatch_async(dispatch_get_main_queue(),{
            successCallback(JSON(value))
          })
        } else {
          NSLog("Unexpected response, not sure what to do about it")
        }
      }
  }
  
}
