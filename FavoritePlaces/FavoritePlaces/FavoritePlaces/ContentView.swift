//
//  ContentView.swift
//  FavoritePlaces
//
//  Created by DevTechie on 4/1/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HomeView()
        //LazyViewExample()
            .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}

struct LazyViewExample: View {
    var body: some View {
        NavigationStack {
            List {
                ForEach(0...10, id: \.self) { i in
                    NavigationLink {
                        LazyView {
                            ItemCellView(itemName: "View \(i)")
                        }
                    } label: {
                        Text("View \(i)")
                    }
                }
            }
            .navigationTitle("DevTechie.com")
        }
    }
}

struct ItemCellView: View {
    var itemName: String
    init(itemName: String) {
        self.itemName = itemName
        print("\(itemName) initialized.")
    }
    var body: some View {
        Text(itemName)
    }
}
