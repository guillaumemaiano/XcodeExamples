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
     List(landmarkData, id: \.id) { landmark in
        LandmarkRow(landmark: landmark)
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
    }
}
