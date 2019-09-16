//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by guillaume MAIANO on 15/09/2019.
//  Copyright © 2019 guillaume MAIANO. All rights reserved.
//

import SwiftUI

struct LandmarkRow: View {
    
    var landmark: Landmark
    
    var body: some View {
        HStack {
            // bleh model holds UI element
            landmark.image.resizable().frame(width: 50,height: 50)
            Text(landmark.name)
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
          Group {
                  LandmarkRow(landmark: landmarkData[0])
                  LandmarkRow(landmark: landmarkData[1])
              }.previewLayout(.fixed(width: 300, height: 70))
    }
}
