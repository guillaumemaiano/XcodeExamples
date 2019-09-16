//
//  LandmarkList.swift
//  Landmarks
//
//  Created by guillaume MAIANO on 16/09/2019.
//  Copyright © 2019 guillaume MAIANO. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
    @State var showFavoritesOnly = false
    
    var body: some View {
        NavigationView {
            List(landmarkData) { landmark in
                if !self.showFavoritesOnly || landmark.isFavorite {
                NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                    LandmarkRow(landmark: landmark)
                    }
                }
            }
                // how to selectively set the bartitle? 
            .navigationBarTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE", "iPhone XS Max"], id: \.self) {
            deviceName in LandmarkList()
            .previewDevice(PreviewDevice(rawValue: deviceName))
        }
    }
}
