//
//  LandmarkList.swift
//  Landmarks
//
//  Created by guillaume MAIANO on 16/09/2019.
//  Copyright © 2019 guillaume MAIANO. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        NavigationView {
            
            List(landmarkData) { landmark in
                NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                    LandmarkRow(landmark: landmark)
                }
            }
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
