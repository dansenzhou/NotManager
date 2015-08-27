//
//  Array.swift
//  NotManager
//
//  Created by Dansen Zhou on 8/27/15.
//  Copyright (c) 2015 Dansen Zhou. All rights reserved.
//

import Foundation
extension Array {
    mutating func shuffle() {
        if count < 2 { return }
        for i in 0..<(count - 1) {
            let j = Int(arc4random_uniform(UInt32(count - i))) + i
            swap(&self[i], &self[j])
        }
    }
}
