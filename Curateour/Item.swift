//
//  Item.swift
//  Curateour
//
//  Created by Maurício Linhares on 3/12/16.
//  Copyright © 2016 pmamightymouse. All rights reserved.
//

import Foundation

/**
 {
 "latitude" : 19.5,
 "dateSearchBegin" : 1780,
 "materials" : "tin glaze, earthenware",
 "date" : "1780-1800",
 "creditLine" : "Purchased with the Special Mexican Fund, 1907",
 "titleOfWork1" : "Vase or Chamber Pot",
 "artistName1" : "Artist\/maker unknown, Mexican",
 "imageFilename" : "1907-305view2.jpg",
 "objectid" : 39434,
 "longitude" : -98.166,
 "geography" : "Puebla",
 "medium" : "Tin-glazed earthenware",
 "dimensions" : "17 x 14 5\/8 inches (43.2 x 37.1 cm)",
 "pmaUrl" : "http:\/\/www.philamuseum.org\/collections\/permanent\/39434.html",
 "galleryLocation" : "Gallery 272, European Art 1500-1850, second floor",
 "dateSearchEnd" : 1800,
 "objectnumber" : "1907-305"
 }
**/

class Item {
  let id : String
  let imageFilename : String
  let title : String
  let location : String
  let medium : String
  let url : String
  
  init(
    id: String,
    imageFilename : String,
    title : String,
    location : String,
    medium : String,
    url : String
    ) {
      self.id = id
      self.imageFilename = imageFilename
      self.title = title
      self.location = location
      self.medium = medium
      self.url = url
  }
  
  static func fromJSON(json : JSON) -> Item? {
    if
      let id = json["objectid"].int,
      let imageFilename = json["imageFilename"].string,
      let title = json["titleOfWork1"].string,
      let location = json["galleryLocation"].string,
      let medium = json["medium"].string,
      let url = json["pmaUrl"].string
    {
      return Item(
        id: String(id),
        imageFilename: imageFilename,
        title: title,
        location: location,
        medium: medium,
        url: url
      )
    } else {
      return Optional.None
    }
  }
  
  
}