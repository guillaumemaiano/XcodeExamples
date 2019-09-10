//
//  RoomStore.swift
//  SwiftUI_WWDC_Example
//
//  Created by guillaume MAIANO on 10/09/2019.
//  Copyright © 2019 guillaume MAIANO. All rights reserved.
//

// SwiftUI was required BindableObject) protocol, now inside Combine as ObservableObject
//import SwiftUI
import Combine

class RoomStore: ObservableObject {
    
    /** Note: this is equivalent, except a few edge cases, to:
     @Published
     var rooms: [Room]
    */
    var rooms: [Room] {
        didSet {
            objectWillChange.send()
        }
    }

    init(rooms: [Room] = []) {
        self.rooms = rooms
    }
    
    var objectWillChange = PassthroughSubject<Void, Never>()
}
