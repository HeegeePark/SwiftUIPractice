//
//  CustomModifier.swift
//  SwiftUIPractice
//
//  Created by 박희지 on 4/19/24.
//

import SwiftUI

struct ImageView: View {
    let image: ImageResource
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        Image(image)
            .resizable()
            .scaledToFit()
            .frame(width: width, height: height)
    }
}

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

struct SubText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 16))
            .foregroundStyle(.secondary)
    }
}

struct RoundedSecondaryBackround: ViewModifier {
    let color: Color
    
    func body(content: Content) -> some View {
        content
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(color)
            )
    }
}

extension View {
    func asMaxWidthBackground() -> some View {
        modifier(MaxWidth())
    }
    
    func asTitleText() -> some View {
        modifier(TitleText())
    }
    
    func asSubText() -> some View {
        modifier(SubText())
    }
    
    func asRoundedSecondaryBackround(_ color: Color = Color.secondBackground) -> some View {
        modifier(RoundedSecondaryBackround(color: color))
    }
}

enum TextStyle {
    case title
    case sub
    
    func set(content: some View) -> some View {
        switch self {
        case .title:
            return AnyView(content.asTitleText())
        case .sub:
            return AnyView(content.asSubText())
        }
    }
}
