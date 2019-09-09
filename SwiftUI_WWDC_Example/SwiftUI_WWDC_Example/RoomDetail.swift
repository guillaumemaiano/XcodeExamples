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
    // @state (source of truth variable) is a mechanism managed by UISwift itself to redraw the body if needed
    // oh, I so hope I'll understand the idea again whenever I check this code out
    // Somewhere around 23:00 in WWDC 2019-204
    @State private var zoomed = false
    
    var body: some View {
       
            // WWDC video was topLeading, but I like it better topTrailing. Whatev'
            ZStack(alignment: .topTrailing) {
                VStack {
                // only the Observation Deck image is available as an asset
                Image(room.imageName)
                    .resizable()
                    .aspectRatio(contentMode: zoomed ? .fill : .fit)
                    // was .tapAction in WWDC 2019-204
                    .onTapGesture { withAnimation {
                        self.zoomed.toggle() }
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    
                Text("Capacity: \(room.capacity) people").italic()
                    // Amazingly, the navbar call works from anywhere within the view
                    .navigationBarTitle(Text(room.name), displayMode: .inline)
            }
            Image(systemName: "video.fill")
                // SF images use the current font to size themselves, so adapt the font to change the image size!
                .font(.title)
                // Avoid the camera image being right close to the edge
                .padding(.all)
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
