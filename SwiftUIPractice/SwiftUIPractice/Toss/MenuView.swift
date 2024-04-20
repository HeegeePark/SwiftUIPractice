//
//  MenuView.swift
//  SwiftUIPractice
//
//  Created by 박희지 on 4/17/24.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            HStack(spacing: 10) {
                setMenu(image: .bank, text: "토스뱅크")
                setMenu(image: .graph, text: "토스증권")
                setMenu(image: .headset, text: "고객센터")
            }
            
        }
    }
    
    func setMenu(image: ImageResource, text: String) -> some View {
        VStack {
            ImageView(image: image,
                      width: 35,
                      height: 35)
            
            Text(text)
        }
        .padding()
        .asMaxWidthBackground()
        .asRoundedSecondaryBackround()
    }
}

#Preview {
    MenuView()
}
