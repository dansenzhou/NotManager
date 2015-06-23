//
//  RecommendedResultViewController.swift
//  NotManager
//
//  Created by Dansen Zhou on 6/5/15.
//  Copyright (c) 2015 Dansen Zhou. All rights reserved.
//

import Foundation
import UIKit

class RecommendedResultViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    private let r1 = Restaurant(name: "Dean & David", image: "dean.jpg", description: "Salad, health")
    private let r2 = Restaurant(name: "Türkenhof", image: "turkenhof.jpg", description: "German, beer")
    private let r3 = Restaurant(name: "Hans im Glück", image: "hans.jpg", description: "Hamburger, pommes")
    private let r4 = Restaurant(name: "Bei Mario", image: "mario.jpg", description: "Italian, pizza")
    private var restaurants = [Restaurant]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.restaurants = [r1, r2, r3, r4]
        // Register custom cell
        var nib = UINib(nibName: "ItemCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "itemcell")
        tableView.tableFooterView = UIView(frame: CGRectZero)
    }
    
    // MARK: Table View
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.restaurants.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell 	{
        var cell:RecommendedItem = self.tableView.dequeueReusableCellWithIdentifier("itemcell") as! RecommendedItem
        
        cell.itemName.text = restaurants[indexPath.row].name
        cell.imageName.image = UIImage(named: restaurants[indexPath.row].image)
//        cell.imgCarName.image = UIImage(named: tableData[indexPath.row])    
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        return cell
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("detail", sender: tableView)
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 200
    }
    
    // MARK: Navigation
    // deal with click cell and pass data
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "detail" {
            var detailViewController = segue.destinationViewController as! ItemDetailViewController
            var row = 0
            if let indexPath = self.tableView.indexPathForSelectedRow() {
                row = indexPath.row
            }
            detailViewController.navigationItem.title = self.restaurants[row].name
        }
    }
    
}
