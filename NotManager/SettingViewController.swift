//
//  SettingViewController.swift
//  NotManager
//
//  Created by Dansen Zhou on 6/7/15.
//  Copyright (c) 2015 Dansen Zhou. All rights reserved.
//

import Foundation
import UIKit

class SettingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var statusArr: [String] = ["Working in office", "Walking on street", "A calendar event", "Watch movie in fullscreen"]
    
    private let cellIdentifier = "Setting Cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register custom cell
        var nib = UINib(nibName: "SettingCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: cellIdentifier)
        tableView.tableFooterView = UIView(frame: CGRectZero)
    }
    
    // MARK: Table View
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.statusArr.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell 	{
        
        var cell:SettingCell = self.tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! SettingCell
        
        cell.statusName.text = statusArr[indexPath.row]
        
        // fetch user default setting
        let userDefaults = NSUserDefaults.standardUserDefaults()
        var count = 0
        if userDefaults.objectForKey(Constants.USER_DEFAULTS_KEYS[indexPath.row]) != nil {
            count = userDefaults.objectForKey(Constants.USER_DEFAULTS_KEYS[indexPath.row]) as! Int
        }
        cell.detailLabel.text = Constants.notificationModes[NotificationModal.getNotificationModeByCount(count)] + ", " + Constants.phoneModes[NotificationModal.getPhoneModeByCount(count)]
        
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("choose", sender: tableView)
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 72.0
    }
    
    override func viewDidAppear(animated: Bool) {
        tableView.reloadData()
    }
    
    // MARK: Navigation
    
    // deal with click cell and pass data
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "choose" {
            var notificationSettingViewController = segue.destinationViewController as! NotificationSettingViewController
            var row = 0
            if let indexPath = self.tableView.indexPathForSelectedRow() {
                row = indexPath.row
            }
            notificationSettingViewController.status = self.statusArr[row]
            notificationSettingViewController.key = Constants.USER_DEFAULTS_KEYS[row]
        }
    }
}

