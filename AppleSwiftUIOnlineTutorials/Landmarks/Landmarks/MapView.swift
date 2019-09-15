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
    
    func makeUIView(context: Context) -> MKMapView {
        return MKMapView(frame: .zero)
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
        
        view.setRegion(makeTurtleRockRegion(), animated: true)
    }
    private func makeTurtleRockRegion() -> MKCoordinateRegion {
        let coordinate = CLLocationCoordinate2D(
            latitude: 34.011286, longitude: -116.166868)
        let span = MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        return region
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
