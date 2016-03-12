//
//  ViewController.swift
//  Curateour
//
//  Created by Maurício Linhares on 3/12/16.
//  Copyright © 2016 pmamightymouse. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var locationLabel: UILabel?
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated);
    NSNotificationCenter.defaultCenter().addObserver(
      self,
      selector: "locationChanged:",
      name: "locationChanged",
      object: nil)
  }
  
  override func viewWillDisappear(animated: Bool) {
    super.viewWillDisappear(animated);
    NSNotificationCenter.defaultCenter().removeObserver(self)
  }

  @objc func locationChanged(notification: NSNotification){
    NSLog("Received location changed notification")
    if let userData = notification.userInfo {
      if let location = userData["currentLocation"] as? pmaLocation {
        self.setLocationLabelContent(location.name)
      }
    }
  }
  
  func setLocationLabelContent(content : String) {
    if let label = self.locationLabel {
      label.text = content
    }
  }
  

}

