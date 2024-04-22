//
//  HomeDetailView.swift
//  SwiftUIPractice
//
//  Created by 박희지 on 4/22/24.
//

import SwiftUI

struct HomeDetailView<T: View>: View {
    let sectionTitle: String
    let image: T
    
    init(
        sectionTitle: String,
        @ViewBuilder image: @escaping () -> T) {
        self.sectionTitle = sectionTitle
        self.image = image()
    }
    
    var body: some View {
        VStack {
            image
            Text(sectionTitle)
        }
    }
}

#Preview {
    HomeDetailView(
        sectionTitle: "첫번째 섹션",
        image: { Image(systemName: "star") }
    )
}
