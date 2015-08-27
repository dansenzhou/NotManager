//
//  UserFeedbackViewController.swift
//  NotManager
//
//  Created by Dansen Zhou on 7/25/15.
//  Copyright (c) 2015 Dansen Zhou. All rights reserved.
//

import Foundation
import UIKit

class UserFeedbackViewController: UIViewController {
    
    var situation: String = ""
    var mode: String = ""
    var objectId: String = ""
    
    @IBOutlet weak var situationLabel: UILabel!
    @IBOutlet weak var modeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        situationLabel.text = situation
        modeLabel.text = mode
    }
    
    override func viewDidDisappear(animated: Bool) {
        situation = ""
        mode = ""
        objectId = ""
    }
    
    @IBAction func likeButWrongTimeAction(sender: AnyObject) {
        var query = PFQuery(className:"Situation")
        query.getObjectInBackgroundWithId(objectId) {
            (situation: PFObject?, error: NSError?) -> Void in
            if error != nil {
                println(error)
            } else if let situation = situation {
                var likeBut = situation["likeBut"] as! Int
                situation["likeBut"] = likeBut + 1
                situation.saveInBackground()
            }
        }
        
        navigateToMain()
        
    }
    @IBAction func dislikeAction(sender: AnyObject) {
        var query = PFQuery(className:"Situation")
        query.getObjectInBackgroundWithId(objectId) {
            (situation: PFObject?, error: NSError?) -> Void in
            if error != nil {
                println(error)
            } else if let situation = situation {
                var dislike = situation["dislike"] as! Int
                situation["dislike"] = dislike + 1
                situation.saveInBackground()
            }
        }

        navigateToMain()
    }
    
    @IBAction func likeAction(sender: AnyObject) {
        var query = PFQuery(className:"Situation")
        query.getObjectInBackgroundWithId(objectId) {
            (situation: PFObject?, error: NSError?) -> Void in
            if error != nil {
                println(error)
            } else if let situation = situation {
                var like = situation["like"] as! Int
                situation["like"] = like + 1
                situation.saveInBackground()
            }
        }

        navigateToMain()
    }
    
    private func navigateToMain() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewControllerWithIdentifier("initialViewController") as! UIViewController
        self.presentViewController(vc, animated: true, completion: nil)
    }
}