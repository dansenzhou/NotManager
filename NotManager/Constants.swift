//
//  NotificationModal.swift
//  NotManager
//
//  Created by Dansen Zhou on 6/9/15.
//  Copyright (c) 2015 Dansen Zhou. All rights reserved.
//

import Foundation

// MARK: Notification Modals
struct Constants {
    static let WOKR_IN_OFFICE = 0
    static let WALK_ON_STREET = 1
    static let CALENDAR_EVENT = 2
    static let FULLSCREEN = 3
    
    static let phoneModes: [String] = ["Sound", "Mute"]
    static let notificationModes: [String] = ["Banner/Alert", "Badge", "Both"]
    
    static let USER_DEFAULTS_WORK_IN_OFFICE = "WORK_IN_OFFICE"
    static let USER_DEFAULTS_WALK_ON_STREET = "WALK_ON_STREET"
    static let USER_DEFAULTS_CALENDAR_EVENT = "CALENDAR_EVENT"
    static let USER_DEFAULTS_FULLSCREEN = "FULLSCREEN"
    static let USER_DEFAULTS_KEYS = [Constants.USER_DEFAULTS_WORK_IN_OFFICE, Constants.USER_DEFAULTS_WALK_ON_STREET, Constants.USER_DEFAULTS_CALENDAR_EVENT, Constants.USER_DEFAULTS_FULLSCREEN]
    
    static let COUNT_SOUND = 1
    static let COUNT_MUTE = 4
    static let COUNT_BANNER = 1
    static let COUNT_BADGE = 2
    static let COUNT_BOTH = 3
}