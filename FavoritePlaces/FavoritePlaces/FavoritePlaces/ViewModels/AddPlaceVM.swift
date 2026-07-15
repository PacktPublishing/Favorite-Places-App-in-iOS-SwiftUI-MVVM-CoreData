//
//  AddPlaceVM.swift
//  FavoritePlaces
//
//  Created by DevTechie on 4/5/23.
//

import Foundation
import SwiftUI
import UIKit

class AddPlaceVM: ObservableObject {
    // textfield props
    @Published var name: String = ""
    @Published var city: String = ""
    @Published var country: String = ""
    @Published var notes: String = ""
    
    // progress props
    @Published var showProgress = false
    
    // image related props
    @Published var image: Image?
    @Published var imageData: Data?
    
    func savePlace() async {
        // core data manager save place logic
        if let data = imageData {
            CoreDataManager.shared.save(name: name, notes: notes, city: city, country: country, imageData: data)
        }
    }
    
    func getImageFor(placeName: String) async {
        let encodedName = placeName.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)!
        let url = URL(string: "https://source.unsplash.com/1080x1350/?\(encodedName)")!
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            await MainActor.run {
                imageData = data
                image = Image(uiImage: UIImage(data: data)!)
            }
        } catch let err {
            print(err.localizedDescription)
        }
    }
}
