//
//  CustomModifier.swift
//  SwiftUIPractice
//
//  Created by 박희지 on 4/19/24.
//

import SwiftUI

struct MaxWidth: ViewModifier {
    func body(content: Content) -> some View {
        content
            .bold()
            .frame(maxWidth: .infinity)
    }
}

struct TitleText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title3)
            .bold()
            .foregroundStyle(.foreground)
    }
}

extension View {
    func asMaxWidthBackground() -> some View {
        modifier(MaxWidth())
    }
    
    func asTitleText() -> some View {
        modifier(TitleText())
    }
}
