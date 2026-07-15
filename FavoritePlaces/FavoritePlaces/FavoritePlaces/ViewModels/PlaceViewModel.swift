//
//  PlaceViewModel.swift
//  FavoritePlaces
//
//  Created by DevTechie on 4/1/23.
//

import Foundation
import SwiftUI

class PlaceViewModel: Identifiable {
    var id: UUID
    var name: String
    var city: String
    var country: String
    var notes: String
    var placeImage: Image
    
    init(id: UUID, name: String, city: String, country: String, notes: String, placeImage: Image) {
        self.id = id
        self.name = name
        self.city = city
        self.country = country
        self.notes = notes
        self.placeImage = placeImage
    }
}

extension PlaceViewModel {
    static var sampleData: [PlaceViewModel] {
        [
            .init(id: UUID(), name: "Golden Gate Bridge", city: "San Francisco", country: "USA", notes: "Must visit Golden Gate Bridge", placeImage: Image("GoldenGateSF")),
            .init(id: UUID(), name: "Hawa Mahal", city: "Jaipur", country: "India", notes: "The pink city with awesome views", placeImage: Image("HawaMahalJaipur")),
            .init(id: UUID(), name: "Eiffel Tower", city: "Paris", country: "France", notes: "Have dinner at Effiel Tower", placeImage: Image("EffielTowerParis")),
        ]
    }
}
