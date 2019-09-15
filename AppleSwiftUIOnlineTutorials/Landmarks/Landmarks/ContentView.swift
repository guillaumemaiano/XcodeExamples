//
//  ContentView.swift
//  Landmarks
//
//  Created by guillaume MAIANO on 14/09/2019.
//  Copyright © 2019 guillaume MAIANO. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            MapView().frame(height:300)
                .edgesIgnoringSafeArea(.top)
            CircleImage()
                .offset(y: -130)
                .padding(.bottom, -130)
            VStack(alignment: .leading) {
                Text("Turtle Rock").font(.title)
                HStack {
                    Text("Joshua National Park").font(.subheadline)
                    Spacer()
                    Text("California").font(.subheadline)
                }
            }.padding()
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
