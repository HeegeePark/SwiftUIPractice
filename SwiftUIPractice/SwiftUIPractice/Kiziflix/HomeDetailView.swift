//
//  HomeDetailView.swift
//  SwiftUIPractice
//
//  Created by 박희지 on 4/22/24.
//

import SwiftUI

struct HomeDetailView<T: View>: View {
    @Binding var sectionTitle: String
    let image: T
    
    init(
        sectionTitle: Binding<String>,
        @ViewBuilder image: @escaping () -> T
    ) {
        self._sectionTitle = sectionTitle
        self.image = image()
    }
    
    var body: some View {
        VStack {
            image
            TextField(sectionTitle, text: $sectionTitle)
                .multilineTextAlignment(.center)
        }
    }
}
