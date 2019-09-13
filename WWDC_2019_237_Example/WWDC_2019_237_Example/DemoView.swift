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
