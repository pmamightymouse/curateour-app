//
//  ToursViewController.swift
//  Curateour
//
//  Created by Maurício Linhares on 3/12/16.
//  Copyright © 2016 pmamightymouse. All rights reserved.
//

import UIKit

class ToursViewController : UITableViewController {
  
  var tours : [Tour] = [Tour]()
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    RestClient.listTours(
      UserDefaults.getEmail(),
      password: UserDefaults.getPassword(),
      successCallback: { tours in
        self.tours = tours
        self.tableView.reloadData()
      },
      errorCallback: { error in
        NSLog("Failed to load tours with \(error.localizedDescription)")
      }
    )
  }
  
  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return tours.count
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return tours.count
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
    let cellIdentifier = "TourCell"
    let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)!
    cell.textLabel!.text = tours[indexPath.item].name
    
    return cell
  }
  
  override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    NSLog("Row \(indexPath.row) selected")    
  }
  
  
}
