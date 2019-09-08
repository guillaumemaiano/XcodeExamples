//
//  Room.swift
//  SwiftUI_WWDC_Example
//
//  Created by guillaume MAIANO on 08/09/2019.
//  Copyright © 2019 guillaume MAIANO. All rights reserved.
//

import SwiftUI

// all I need for identifiable is the id property
struct Room : Identifiable {
    var id = UUID()
    var name: String
    var capacity: Int
    var hasVideo: Bool = false
    
    var imageName: String { return name }
    var thumbnailName: String { return name + "Thumb" }
}

#if DEBUG

let testData = [
    // for several pics there is a stupid pun
    // pics from google image result miniatures (fair use)
    Room( name: "Observation Deck", capacity: 6, hasVideo: true),
    Room( name: "Executive Deck", capacity: 8, hasVideo: false),
    Room( name: "Charter Deck", capacity: 16, hasVideo: true),
    Room( name: "Dungeon Deck", capacity: 10, hasVideo: true),
    Room( name: "Panorama Deck", capacity: 6, hasVideo: true),
    Room( name: "Oceanfront Deck", capacity: 6, hasVideo: false),
    Room( name: "Rainbow Deck", capacity: 8, hasVideo: false),
    Room( name: "Pastoral Deck", capacity: 6, hasVideo: true),
    Room( name: "Elephant Deck", capacity: 1, hasVideo: false),
    Room( name: "War Deck", capacity: 6, hasVideo: false),
]
#endif
