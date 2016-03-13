//
//  StopViewController.swift
//  Curateour
//
//  Created by Maurício Linhares on 3/13/16.
//  Copyright © 2016 pmamightymouse. All rights reserved.
//

import UIKit

class StopViewController : UIViewController {
  
  var stop : Stop?
  @IBOutlet weak var pictureImageView : UIImageView?
  @IBOutlet weak var userTextLabel : UILabel?
  @IBOutlet weak var itemImageView : UIImageView?
  @IBOutlet weak var itemTextLabel : UILabel?
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    
    if
      let current = stop,
      let userLabel = userTextLabel,
      let itemLabel = itemTextLabel
    {
      userLabel.text = current.title
      itemLabel.text = current.media
    }
  }
  
  
}
