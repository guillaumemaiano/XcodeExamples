//
//  UserData.swift
//  Landmarks
//
//  Created by guillaume MAIANO on 16/09/2019.
//  Copyright © 2019 guillaume MAIANO. All rights reserved.
//

import SwiftUI
import Combine

// SwiftUI subscribes to the object and updates views whenever the object changes
final class UserData: ObservableObject {
    
    // @Published sends notifications to SwiftUI (the subscriber)
    @Published var restrictFavorites = false
    @Published var landmarks = landmarkData
}
