//
//  ItemDetailViewController.swift
//  NotManager
//
//  Created by Dansen Zhou on 6/7/15.
//  Copyright (c) 2015 Dansen Zhou. All rights reserved.
//

import Foundation
import UIKit
import Parse

class ItemDetailViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func sendPushNotification(sender: AnyObject) {
        //PFCloud.callFunction("PushSituation1", withParameters: nil)
    }
    
    @IBAction func sendAndroidNotification(sender: AnyObject) {
        PFCloud.callFunction("PushAndroid", withParameters: nil)
    }
    
    
}