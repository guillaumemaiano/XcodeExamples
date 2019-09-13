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
    // Note: was @ObjectBinding before Beta 5
    @ObservedObject var store = RoomStore()
    var body: some View {
        NavigationView {
            List {
                Section {
                    Button(action: addRoom) {
                        // Localization is explained (quickly) around 48:30
                        // Locale can be tested in the previews, super cool
                        Text("Add room")
                    }
                }
                Section {
                    // Foreach creates view for each element, so I may mix static and dynamic content
                    ForEach(store.rooms) { room in
                        // NavigationBar has changed to NavigationLink
                        RoomCellView(room: room)
                    }
                // OK so how do I sort delete-rows from no-delete-rows?
                // Y'know customer will want some rows that can be deleted and some, not
                // Option 1: groups
                // Option 2: filter
                // Option 3: ???
                // corollary: how to prevent slide entirely to delete while leaving slide to show button
                .onDelete(perform: delete)
                .onMove(perform: move)
                }
            }
                // title gets set on content (NOT on NavigationView)
                .navigationBarTitle(Text("Rooms"))
                .navigationBarItems(trailing: EditButton())
                // before Beta 5: .listStyle(.grouped)
                .listStyle(GroupedListStyle())
        }
    }
    
    func addRoom() {
        store.rooms.append(Room(name: "Hall", capacity: 2000))
    }
    
    func delete(at offsets: IndexSet) {
        store.rooms.remove(atOffsets: offsets)
    }
    
    func move(from source: IndexSet, to destination: Int) {
        store.rooms.move(fromOffsets: source, toOffset: destination)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView(store: RoomStore(rooms: testData))
            ContentView(store: RoomStore(rooms: testData))
                .environment(\.sizeCategory, .extraExtraExtraLarge)
            ContentView(store: RoomStore(rooms: testData))
            .environment(\.colorScheme, .dark)
            ContentView(store: RoomStore(rooms: testData))
                .environment(\.layoutDirection, .rightToLeft)
                // WWDC example is arabic, works fine with Hebrew
            .environment(\.locale, Locale(identifier: "he"))
        }
        
    }
}

// Struct was auto-extracted via cmd-click > extract subview
// Room var was typed in, system doesn't yet detect vars to be created during extraction
struct RoomCellView: View {
    
    let room: Room
    var body: some View {
        NavigationLink(destination: RoomDetail(room: room)) {
            
            Image( room.thumbnailName)
                .cornerRadius(6.0)
            VStack(alignment: .leading) {
                Text(room.name)
                Text("\(room.capacity) people")//, comment: "Capacity")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}
