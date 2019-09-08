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

struct ContentView: View {
    
    var rooms: [Room] = []
    var body: some View {
        NavigationView {
        List(rooms) { room in
            // NavigationBar has changed to NavigationLink
            NavigationLink(destination: Text(room.name)) {
            
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
