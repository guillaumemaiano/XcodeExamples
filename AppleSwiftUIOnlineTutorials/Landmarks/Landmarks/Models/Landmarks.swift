//
//  Landmarks.swift
//  Landmarks
//
//  Created by guillaume MAIANO on 15/09/2019.
// Apple-provided tutorial
// https://developer.apple.com/tutorials/swiftui/building-lists-and-navigation

import SwiftUI
import CoreLocation

struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    fileprivate var imageName: String
    fileprivate var coordinates: Coordinates
    var state: String
    var park: String
    var category: Category

    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }

    // nice category-defining technique
    enum Category: String, CaseIterable, Codable, Hashable {
        case featured = "Featured"
        case lakes = "Lakes"
        case rivers = "Rivers"
    }
}

extension Landmark {
    // kinda weird to have a UI element inside a model...
    var image: Image {
        // requires another custom Apple-provided file
        ImageStore.shared.image(name: imageName)
    }
}

struct Coordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}
