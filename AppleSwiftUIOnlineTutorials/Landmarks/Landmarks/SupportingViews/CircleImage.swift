//
//  CircleImage.swift
//  Landmarks
//
//  Created by guillaume MAIANO on 15/09/2019.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    var body: some View {
        image
            .clipShape(Circle())
            .overlay(Circle()
            .stroke(lineWidth: 5.0)
            .foregroundColor(.white))
            .shadow(radius: 10.0)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: landmarkData[0].image)
    }
}
