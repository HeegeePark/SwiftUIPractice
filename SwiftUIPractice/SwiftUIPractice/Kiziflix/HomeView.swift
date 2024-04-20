//
//  HomeView.swift
//  SwiftUIPractice
//
//  Created by 박희지 on 4/20/24.
//

import SwiftUI

struct HomeView: View {
    let nickname: String
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
    }
}

#Preview {
    HomeView(nickname: "kizi")
}
