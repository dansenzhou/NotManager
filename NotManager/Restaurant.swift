//
//  Restaurant.swift
//  NotManager
//
//  Created by Dansen Zhou on 6/9/15.
//  Copyright (c) 2015 Dansen Zhou. All rights reserved.
//

import Foundation

class Restaurant {
    var name: String
    var image: String
    var description: String
    
    init(name: String, image: String, description: String){
        self.name = name
        self.image = image
        self.description = description
    }
    
    init(){
        self.name = ""
        self.image = ""
        self.description = ""
    }

}