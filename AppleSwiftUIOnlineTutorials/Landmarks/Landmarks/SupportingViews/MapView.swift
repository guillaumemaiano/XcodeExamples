//
//  MapView.swift
//  Landmarks
//
//  Created by guillaume MAIANO on 15/09/2019.
//  Copyright © 2019 guillaume MAIANO. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: View, UIViewRepresentable {
    
    var coordinates: CLLocationCoordinate2D
    
    func makeUIView(context: Context) -> MKMapView {
        return MKMapView(frame: .zero)
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
        
        view.setRegion( landmarkRegion(), animated: true)
    }

    private func landmarkRegion() -> MKCoordinateRegion {
        
        let span = MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
        let region = MKCoordinateRegion(center: coordinates, span: span)
        return region
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinates: landmarkData[0].locationCoordinate)
    }
}
