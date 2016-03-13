//
//  Stop.swift
//  Curateour
//
//  Created by Maurício Linhares on 3/12/16.
//  Copyright © 2016 pmamightymouse. All rights reserved.
//

import Foundation

class Stop {
  
  let id : Int?
  let title : String
  let media : String
  let itemId : String
  let tourId : Int
  let stopNumber : Int
  
  init(
    title : String,
    media : String,
    itemId : String,
    tourId : Int,
    stopNumber : Int,
    id : Int? = Optional.None
    ) {
      self.title = title
      self.media = media
      self.itemId = itemId
      self.tourId = tourId
      self.stopNumber = stopNumber
      self.id = id
  }
  
  static func fromJSON( json : JSON) -> Stop? {
    
    if
      let title = json["title"].string,
      let media = json["media"].string,
      let itemId = json["item_id"].string,
      let tourId = json["tour_id"].int,
      let stopNumber = json["stop_number"].int,
      let id = json["id"].int
    {
      return Stop(
        title: title,
        media: media,
        itemId: itemId,
        tourId: tourId,
        stopNumber: stopNumber,
        id: id
      )
    } else {
      return Optional.None
    }
    
  }
  
}