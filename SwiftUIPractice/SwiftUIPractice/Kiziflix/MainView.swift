//
//  MainView.swift
//  SwiftUIPractice
//
//  Created by 박희지 on 4/21/24.
//

import SwiftUI

struct MainView: View {
    let nickname: String
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            TabView {
                HomeView(nickname: nickname)
                    .tabItem {
                        Image(systemName: "house")
                        Text("홈")
                    }
            }
            .tint(.white)
        }
    }
}

#Preview {
    MainView(nickname: "kizi")
}
