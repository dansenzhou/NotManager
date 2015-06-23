//
//  RecommendedItem.swift
//  NotManager
//
//  Created by Dansen Zhou on 6/5/15.
//  Copyright (c) 2015 Dansen Zhou. All rights reserved.
//

import Foundation
import UIKit

class RecommendedItem: UITableViewCell {
    
    @IBOutlet weak var imageName: UIImageView!
    @IBOutlet weak var itemName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}