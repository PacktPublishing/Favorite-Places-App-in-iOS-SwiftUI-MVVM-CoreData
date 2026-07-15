//
//  PlacesListVM.swift
//  FavoritePlaces
//
//  Created by DevTechie on 4/5/23.
//

import Foundation
import SwiftUI
import UIKit

class PlacesListVM: ObservableObject {
    @Published var places = [PlaceViewModel]()
    @Published var showAddSheet = false
    
    init() {
        fetchPlaces()
    }
    
    func fetchPlaces() {
        //places = PlaceViewModel.sampleData
        
        // core data manager logic
        places = CoreDataManager.shared.getAll().map({ place in
            PlaceViewModel(id: place.id!, name: place.name!, city: place.city!, country: place.country!, notes: place.notes!, placeImage: Image(uiImage: UIImage(data: place.image!)!))
        })
    }
}
