//
//  ContentView.swift
//  SwiftUI_WWDC_Example
//
//  Created by guillaume MAIANO on 08/09/2019.
//  Copyright © 2019 guillaume MAIANO. All rights reserved.
//

import SwiftUI
// https://developer.apple.com/videos/play/wwdc2019/204/

// Note: SF Symbol is cool
// -> Image(systemName: "photo")

// NOte:  Option-Cmd-P makes the preview window reload

struct ContentView: View {
    
    var rooms: [Room] = []
    var body: some View {
        NavigationView {
        List(rooms) { room in
            // NavigationBar has changed to NavigationLink
            RoomCellView(room: room)
        }
            // title gets set on content (NOT on NavigationView)
            .navigationBarTitle(Text("Rooms"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(rooms: testData)
    }
}

// Struct was auto-extracted via cmd-cick > extract subview
// Room var was typed in, system doesn't yet detect vars to be created during extraction
struct RoomCellView: View {
    
    let room: Room
    var body: some View {
        NavigationLink(destination: RoomDetail(room: room)) {
            
            Image( room.thumbnailName)
                .cornerRadius(6.0)
            VStack(alignment: .leading) {
                Text(room.name)
                Text("\(room.capacity) people")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}
