//
//  Tour.swift
//  Curateour
//
//  Created by Maurício Linhares on 3/12/16.
//  Copyright © 2016 pmamightymouse. All rights reserved.
//

import Foundation

class Tour {
  
  let id : Int
  let name : String
  var stops : [Stop] = [Stop]()
  
  init(id : Int, name: String) {
    self.id = id
    self.name = name
  }
  
  static func fromJSON( json : JSON ) -> Tour? {
    if let name = json["name"].string, let id = json["id"].int {
      var stops = [Stop]()
      
      for (_,subJson):(String, JSON) in json["stops"] {
        NSLog("found stop")
        if let item = Stop.fromJSON(subJson) {
          stops.append(item)
        }
      }
    
      let tour = Tour(id: id, name: name)
      tour.stops = stops
      
      return tour
    } else {
      return Optional.None
    }
  }
  
}