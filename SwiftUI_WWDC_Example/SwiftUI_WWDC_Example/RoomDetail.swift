 //
//  RoomDetail.swift
//  SwiftUI_WWDC_Example
//
//  Created by guillaume MAIANO on 09/09/2019.
//  Copyright © 2019 guillaume MAIANO. All rights reserved.
//

import SwiftUI

struct RoomDetail: View {
    let room: Room

    var body: some View {
        VStack {
            // only the Observation Deck image is available as a asset
            Image(room.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                Text("Capacity: \(room.capacity) people").italic()
                // Amazingly, the navbar call works from anywhere within the view
                    .navigationBarTitle(Text(room.name), displayMode: .inline)
        }
    }
}

#if DEBUG
struct RoomDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
        RoomDetail(room: testData[0])
        }
    }
}
#endif
