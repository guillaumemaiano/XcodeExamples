//
//  ContentView.swift
//  WWDC_2019_237_Example
//
//  Created by guillaume MAIANO on 13/09/2019.
//  Copyright © 2019 guillaume MAIANO. All rights reserved.
//
// https://developer.apple.com/videos/play/wwdc2019/237/

import SwiftUI
/**
 # Layout process
 - Step 1: parent proposes a size
 - Step 2: child chooses its own size, parent has to respect that choice
 - Step 3: root view places child in coordinate space
 
 */
struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                AlienadoToast()
                Spacer()
                NavigationLink(destination: GraphicsView()) {
                    Text("Graphical Displays").foregroundColor(.white)
                    .padding() .background(Color(.systemBlue))
                }
            }.padding(.bottom)
            .edgesIgnoringSafeArea(.all)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.colorScheme, .dark)
    }
}

struct AlienadoToast: View {
    var body: some View {
        HStack {
            VStack {
                Text("👽👽👽👽👽👽")
                Text("Five aliens")
            }.font(.caption)
            VStack {
                NavigationLink(destination: DemoView()) {
                    Text("Alienado Toast👽")
                        .foregroundColor(.white)
                        /** padding is automated to adapt to platform, dynamic type size and environment */
                        .padding()
                        // .padding([.leading, .trailing])
                        // auto-turns into: .padding(.horizontal)
                        /**
                         Setting a background color allows observing the bounds without a preview canvas
                         */
                        .background(Color.green)
                }
            }
        }
    }
}
