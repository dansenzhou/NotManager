//
//  NotificationModal.swift
//  NotManager
//
//  Created by Dansen Zhou on 6/23/15.
//  Copyright (c) 2015 Dansen Zhou. All rights reserved.
//

import Foundation

class NotificationModal {
    var phoneMode: String = ""
    var notificationMode: String = ""

    init() {
        
    }
    class func getPhoneModeByCount(count: Int) -> Int {
        switch count {
        case 2, 3, 4:
            // sound
            return 0
        case 5, 6, 7:
            // mute
            return 1
        default:
            return 0
        }
    }
    
    class func getNotificationModeByCount(count: Int) -> Int {
        switch count {
        case 2, 5:
            // Banner/Alert
            return 0
        case 3, 6:
            // Badge
            return 1
        case 4, 7:
            // Both
            return 2
        default:
            return 0
        }
    }
    
    class func getCount(phoneMode: Int, notificationMode: Int) -> Int {
        var count = 0
        switch phoneMode {
        case 0:
            count = count + 1
            break
        case 1:
            count = count + 4
            break
        default:
            return 2
        }
        switch notificationMode {
        case 0:
            count = count + 1
            break
        case 1:
            count = count + 2
            break
        case 2:
            count = count + 3
            break
        default:
            return 2
        }
        return count
    }
}