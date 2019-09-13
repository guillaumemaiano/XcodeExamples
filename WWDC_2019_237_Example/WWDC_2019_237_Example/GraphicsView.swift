//
//  GraphicsView.swift
//  WWDC_2019_237_Example
//
//  Created by guillaume MAIANO on 13/09/2019.
//  Copyright © 2019 guillaume MAIANO. All rights reserved.
//

import SwiftUI

struct GraphicsView: View {
    var body: some View {
            PlanetDataView()
    }
}

struct GraphicsView_Previews: PreviewProvider {
    static var previews: some View {
        GraphicsView()
    }
}

struct PlanetDataView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Imperial System Ryza").font(.callout).layoutPriority(1).lineLimit(1)
                Text("Type: ForgeWorld").font(.caption)
                Text("Population: 53 Trillion").font(.caption)
                Text("Food production: null").font(.caption)
            }.foregroundColor(.red).padding().layoutPriority(1)
            Circle().fill(LinearGradient(gradient: Gradient(colors: [.red, .orange, .yellow, .white]), startPoint: .leading, endPoint: .bottom)).aspectRatio(contentMode: .fit).padding(.trailing)
        }.padding()
            .background(Color.black)
    }
}
