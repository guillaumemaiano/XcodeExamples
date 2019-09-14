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
    @State var planetData = true
    var body: some View {
        HStack {
            if planetData {
                VStack(alignment: .leading) {
                    Text("Imperial System Ryza").font(.callout).layoutPriority(1).lineLimit(1)
                    Text("Type: ForgeWorld").font(.caption)
                    Text("Population: 53 Trillion").font(.caption)
                    Text("Food production: null").font(.caption)
                }.foregroundColor(.red).padding().layoutPriority(1).onTapGesture {
                    withAnimation(.easeIn(duration: 1.0)){ self.togglePlanetData()
                    }
                    
                }
            } else {
                VStack(alignment: .center) {
                    Text("Planet data").font(.caption).foregroundColor(.red)
                    // so ugly wow...
                    //                    ZStack {
                    //                        Ellipse().stroke(Color.red)
                    Text("📊🌐📋").foregroundColor(.red)
                    //                    }
                }.onTapGesture {
                    withAnimation(.easeIn(duration: 0.3)){ self.togglePlanetData()
                    }
                    
                }
            }
            PlanetDetailsInteractiveView(hideOutline: !planetData)
        }.padding()
            .background(Color.black)
    }
    
    func togglePlanetData() {
        planetData.toggle()
    }
}

struct PlanetDetailsInteractiveView: View {
    @State private var dataDisplayed = false
    var hideOutline: Bool
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Circle().fill(LinearGradient(gradient: Gradient(colors: [.red, .orange, .yellow, .white]), startPoint: .leading, endPoint: .bottom)).aspectRatio(contentMode: .fit).padding(.trailing)
                    .onTapGesture { withAnimation(.easeOut(duration: 2.0)){
                        self.displayData()
                        }
                }
                if dataDisplayed {
                    DefenseCollapsibleView(outline: hideOutline)
                }
            }
            if dataDisplayed {
                VStack(alignment: .trailing) {
                    Text("Strategic Value").foregroundColor(.orange)
                    Text("Ultimate").foregroundColor(.red)
                }
            }
        }
    }
    
    func displayData() {
        dataDisplayed.toggle()
    }
}

struct DefenseCollapsibleView: View {
    var outline: Bool
    var body: some View {
        ZStack {
            if outline {
                Capsule().strokeBorder(Color.red, style:
                    StrokeStyle(lineWidth: 5, lineCap: .square, lineJoin: .round, miterLimit: 0, dash: [5,3], dashPhase: 10))
            }
            VStack(alignment: .leading) {
                Text("Main defense").bold().font(.footnote).foregroundColor(.orange)
                Text("Ordo Mechanicum")
                    .font(.footnote).foregroundColor(.red)
                    .lineLimit(1)
                    .layoutPriority(2)
            }
        }
    }
}
// Note: their cool example is available in the attached files, so I won't play along here, and just dl and compile it myself ^^
