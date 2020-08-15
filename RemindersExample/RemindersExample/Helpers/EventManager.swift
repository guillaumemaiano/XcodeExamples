//
//  EventManager.swift
//  RemindersExample
//
//  Created by guillaume MAIANO on 19/09/2019.
//  Copyright © 2019 guillaume MAIANO. All rights reserved.
//

import Foundation
import EventKit

/**
 An EKEventStore object requires a relatively large amount of time to initialize and release. Consequently, you should not initialize and release a separate event store for each event-related task. Instead, initialize a single event store when your app loads, and use it repeatedly to ensure that your connection is long-lived.

 An event store instance must not be released before other EventKit objects; otherwise, undefined behavior may occur.
 */
struct EventManager {
    static let store = EKEventStore()
    // If your app modifies a user’s Calendar database, it must get confirmation from the user before doing so. An app should never modify the Calendar database without specific instruction from the user.
    func hasPermission() -> Bool {
        
        switch EKEventStore.authorizationStatus(for: .reminder) {
        case .notDetermined:
            print("Ask permissions")
            return false
        case .denied:
            print("Not allowed, request user opening settings")
            return false
        case .authorized:
            print("Authorized, proceeding...")
            return true
        case .restricted:
            print("The app cannot access that service")
            return false
        @unknown default:
            print("Apple changed EKEventStore")
            return false
        }
    }
    
    static func askPermissions(handler: @escaping (Bool, Error?)-> Void) {
        store.requestAccess(to: .event, completion: handler)
    }
}
