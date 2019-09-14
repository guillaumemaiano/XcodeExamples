//
//  PlantDetailsView.swift
//  WWDC_2019_231_Example
//
//  Created by guillaume MAIANO on 14/09/2019.
//  Copyright © 2019 guillaume MAIANO. All rights reserved.
//

import SwiftUI

struct PlantDetailsView: View {
    var body: some View {
        
        return GeometryReader {
            container in ScrollView {
                VStack {
                    HeaderView(image: self.plant.cgImage, axLabel: self.plant.name)
                    VStack(alignment: .leading) {
                        Text(verbatim: self.plant.name)
                            .font(Font.largeTitle)
                            .multilineTextAlignment(.leading)
                            .frame(alignment: .leading)
                        Text(verbatim: self.plant.kind)
                            .foregroundColor(.green)
                        
                        VStack(alignment: .leading, spacing: CGFloat(5.0)) {
                            Text("Notes").foregroundColor(.gray)
                            Text(self.plant.notes)
                        }
                    }
                }
            }
        }
    }
    
    var plant: Plant
}

struct HeaderView: View {
    
    var image: CGImage
    var axLabel: String
    
    var body: some View {
        Image(image, scale: 1.0, label: Text(axLabel))
    }
}

struct PlantDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let image = UIImage(named: "venomOak")
        let cgImage = image?.cgImage
        return PlantDetailsView( plant: Plant(notes: "Do not grow", kind: "Deathtree", name: "Venom Oak", cgImage: cgImage!))
    }
}
