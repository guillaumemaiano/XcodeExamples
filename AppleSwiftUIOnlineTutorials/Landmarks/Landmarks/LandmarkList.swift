//
//  LandmarkList.swift
//  Landmarks
//
//  Created by guillaume MAIANO on 16/09/2019.
//  Copyright © 2019 guillaume MAIANO. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
    //@State var showFavoritesOnly = false
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        NavigationView {
            List {
                // technique to pass dynamic/static in list, or combine groups of dynamic views
                // Use  to access a binding to a state variable
                Toggle(isOn: $userData.restrictFavorites) {
                    Text("Favorites")
                } 
                ForEach(landmarkData) { landmark in
                    if !self.userData.restrictFavorites || landmark.isFavorite {
                        NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                            LandmarkRow(landmark: landmark)
                        }
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
                .environmentObject(UserData())
        }
    }
}
