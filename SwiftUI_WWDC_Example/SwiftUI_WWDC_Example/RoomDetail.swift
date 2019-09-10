 //
 //  RoomDetail.swift
 //  SwiftUI_WWDC_Example
 //
 //  Created by guillaume MAIANO on 09/09/2019.
 //  Copyright © 2019 guillaume MAIANO. All rights reserved.
 //
 
import SwiftUI
 // Note after much perplexity, option + cmd + enter toggles the canvas
struct RoomDetail: View {
    let room: Room
    // @state (source of truth variable) is a mechanism managed by UISwift itself to redraw the body if needed
    // oh, I so hope I'll understand the idea again whenever I check this code out
    // Somewhere around 23:00 in WWDC 2019-204
    // Private to reinforce the idea this is for use of the view, locally, exclusively, only.
    @State private var zoomed = false
    
    // Note: to avoid building bindings for variable UI elements, .constant exists: let timeMachineDateSelector = Slider(value: .constant(1515))
    
    // Note: All containers in SwiftUI must return no more than ten children. Groups allow returning blocks of stuff to get more children if needed, like Logical Partitions vs Physical Partitions on HDDs.

    var body: some View {
       
            // WWDC video was topLeading, but I like it better topTrailing. Whatev'
            ZStack(alignment: .topTrailing) {
                VStack {
                // only the Observation Deck image is available as an asset
                Image(room.imageName)
                    .resizable()
                    .aspectRatio(contentMode: zoomed ? .fill : .fit)
                    // was .tapAction in WWDC 2019-204
                    .onTapGesture { withAnimation(
                        // basic doesn't exist anymore, linear works fine
                                .linear(duration: 2)) {
                        self.zoomed.toggle() }
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)

                Text("Capacity: \(room.capacity) people").italic()
                    // Amazingly, the navbar call works from anywhere within the view
                    .navigationBarTitle(Text(room.name), displayMode: .inline)
            }
            
            if room.hasVideo && !zoomed {
            Image(systemName: "video.fill")
                // SF images use the current font to size themselves, so adapt the font to change the image size!
                .font(.title)
                // Avoid the camera image being right close to the edge
                .padding(.all)
                .transition(.move(edge: .trailing))

           }
        }
    }
 }
 
#if DEBUG
struct RoomDetail_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
            RoomDetail(room: testData[0])
            }
            // so I added a Wookia pic from Executor's deck (terribad resolution, because fair use) for that Executive Deck ^^
            NavigationView {
                RoomDetail(room: testData[1])
            }
            /** Cool feature, define preview devices */
            NavigationView {
            RoomDetail(room: testData[0])
            }
               .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
               .previewDisplayName("iPhone SE")

            NavigationView {
            RoomDetail(room: testData[0])
            }
               .previewDevice(PreviewDevice(rawValue: "iPhone XS Max"))
               .previewDisplayName("iPhone XS Max")
            /**Management of target options */
            NavigationView {
            RoomDetail(room: testData[0])
            }.environment(\.sizeCategory, .accessibilityExtraExtraExtraLarge)
            NavigationView {
            RoomDetail(room: testData[0])
            }.environment(\.colorScheme, .dark)
   
        }
    }
 }
#endif
