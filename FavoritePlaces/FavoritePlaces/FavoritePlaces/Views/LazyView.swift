//
//  LazyView.swift
//  FavoritePlaces
//
//  Created by DevTechie on 4/27/23.
//

import SwiftUI

struct LazyView<Content: View>: View {
    let content: () -> Content
    
    init(@ViewBuilder _ content: @escaping () -> Content) {
        self.content = content
    }
    
    var body: some View {
        content()
    }
}
