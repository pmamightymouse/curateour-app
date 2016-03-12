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
  
  init(id : Int, name: String) {
    self.id = id
    self.name = name
  }
  
  static func fromJSON( json : JSON ) -> Tour? {
    if let name = json["name"].string, let id = json["id"].int {
      return Tour(id: id, name: name)
    } else {
      return Optional.None
    }
  }
  
}