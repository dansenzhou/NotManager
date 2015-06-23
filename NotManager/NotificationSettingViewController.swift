//
//  NotificationSettingViewController.swift
//  NotManager
//
//  Created by Dansen Zhou on 6/7/15.
//  Copyright (c) 2015 Dansen Zhou. All rights reserved.
//

import Foundation
import UIKit

class NotificationSettingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var notificationModalTableView: UITableView!
    
    
    var status = "Status"
    var key = ""
    
    private var notificationModeIndexPath: NSIndexPath? = nil
    private var phoneModeIndexPath: NSIndexPath? = nil
    private var count: Int?
    private let cellIdentifier = "Notification Modal Cell"
    
    //saving user preferences
    let userDefaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        statusLabel.text = status
        notificationModalTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        notificationModalTableView.tableFooterView = UIView(frame: CGRectZero)
        
        count = userDefaults.objectForKey(key) as! Int?
        
        if(count == nil) {
            count = 2
            userDefaults.setObject(count, forKey: key)
        }
    }
    
    // MARK: Table View
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 3
        }
        return 2
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell:UITableViewCell = self.notificationModalTableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! UITableViewCell
        if indexPath.section == 0 {
            cell.accessoryType = (notificationModeIndexPath?.row == indexPath.row) ? .Checkmark : .None
            cell.textLabel!.text = Constants.notificationModes[indexPath.row]
        
            if (NotificationModal.getNotificationModeByCount(count!) == indexPath.row) {
                cell.accessoryType = .Checkmark
                notificationModeIndexPath = indexPath
            }
        } else {
            cell.accessoryType = (phoneModeIndexPath?.row == indexPath.row) ? .Checkmark : .None
            cell.textLabel!.text = Constants.phoneModes[indexPath.row]
            
            if (NotificationModal.getPhoneModeByCount(count!) == indexPath.row) {
                cell.accessoryType = .Checkmark
                phoneModeIndexPath = indexPath
            }

        }
        return cell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        if indexPath.section == 0 {
            if indexPath.row != notificationModeIndexPath?.row {
                if let lastSelectedIndexPath = notificationModeIndexPath {
                    let oldCell = tableView.cellForRowAtIndexPath(lastSelectedIndexPath)
                    oldCell?.accessoryType = .None
                }
            
                let newCell = tableView.cellForRowAtIndexPath(indexPath)
                newCell?.accessoryType = .Checkmark
  
                notificationModeIndexPath = indexPath
            }
        } else {
            if indexPath.row != phoneModeIndexPath?.row {
                if let lastSelectedIndexPath = phoneModeIndexPath {
                    let oldCell = tableView.cellForRowAtIndexPath(lastSelectedIndexPath)
                    oldCell?.accessoryType = .None
                }
                
                let newCell = tableView.cellForRowAtIndexPath(indexPath)
                newCell?.accessoryType = .Checkmark
                
                phoneModeIndexPath = indexPath
            }

        }
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Notification Mode"
        }
        return "Phone Mode"
    }
    
    // save setting
    override func viewDidDisappear(animated: Bool) {
        count = NotificationModal.getCount(phoneModeIndexPath!.row, notificationMode: notificationModeIndexPath!.row)
        println("Save - \(key): \(count)")
        userDefaults.setObject(count , forKey: key)
    }
    
    override func viewDidAppear(animated: Bool) {
        count = 0
    }
}
