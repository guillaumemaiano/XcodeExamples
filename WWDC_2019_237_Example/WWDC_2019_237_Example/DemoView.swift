//
//  DemoView.swift
//  WWDC_2019_237_Example
//
//  Created by guillaume MAIANO on 13/09/2019.
//  Copyright © 2019 guillaume MAIANO. All rights reserved.
//

import SwiftUI

struct DemoView: View {
    var body: some View {
        VStack {
            Spacer()
            //HStack(alignment: .bottom) {
            // .lastTextBaseline will align all text properly on the baseline instead
            HStack(alignment: .lastTextBaseline) {
                Text("Delicious").font(.caption)
                // alignment factor different from WWDC because it's not the same avocado image ^^
                Image("avocado")
                    .alignmentGuide(.lastTextBaseline) {
                        d in d[.bottom] * 0.86
                }
                Text("Alienado Toast").layoutPriority(1)
            }.lineLimit(1)
            Spacer()
            HStack(alignment: .midAlienAndTitle) {
                VStack {
                    Text("🚀🚀🚀🚀🚀")
                    .alignmentGuide(.midAlienAndTitle) { d in
                        d[.bottom] / 2
                    }
                    Text("5 rockets")
                }.font(.caption)
                VStack(alignment: .leading) {
                    HStack {
                        Text("Alienado Toast").font(.title)
                    .alignmentGuide(.midAlienAndTitle) { d in
                        d[.bottom] / 2
                    }
                        Spacer()
                        // Resizing because my image is different from WWDC's 60 points
                        Image("avocado").resizable().frame(width: 60, height: 60)
                    }
                    Text("Ingredients: Avocado, Almond Butter, Bread, Red Pepper Flakes").font(.caption).lineLimit(1)
                }
            }
            Spacer()
        }
    }
}

struct DemoView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DemoView()
            DemoView().previewDevice(PreviewDevice(rawValue: "iPhone SE"))
                .previewDisplayName("iPhone SE")
        }
    }
}
