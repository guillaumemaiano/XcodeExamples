//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by guillaume MAIANO on 14/09/2019.
//  Copyright © 2019 guillaume MAIANO. All rights reserved.
//

import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject var userData: UserData
    
    var landmark: Landmark
    
    var landmarkIndex: Int {
        // force it
        userData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }

    var body: some View {
        VStack {
            MapView(coordinates: landmark.locationCoordinate).frame(height:300)
                .edgesIgnoringSafeArea(.top)
            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name).font(.title)
                    Button(action:{}) {
                        if self.userData.landmarks[self.landmarkIndex].isFavorite {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        } else {
                        Image(systemName: "star")
                            .foregroundColor(.secondary)
                        }
                    }
                }
                HStack {
                    Text(landmark.park).font(.subheadline)
                    Spacer()
                    Text(landmark.state).font(.subheadline)
                }
            }.padding()
            Spacer()
        }
        .navigationBarTitle(Text(landmark.name), displayMode: .inline)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LandmarkDetail(landmark: landmarkData[0])
            LandmarkDetail(landmark: landmarkData[7])
        }.environmentObject(UserData())
    }
}
