//
//  SettingCell.swift
//  NotManager
//
//  Created by Dansen Zhou on 6/7/15.
//  Copyright (c) 2015 Dansen Zhou. All rights reserved.
//

import Foundation
import UIKit

class SettingCell: UITableViewCell {
    
    @IBOutlet weak var statusName: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}