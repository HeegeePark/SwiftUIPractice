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

struct TGTitleText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(.black)
            .font(.callout)
            .bold()
            .padding(8)
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

struct RoundedStrokeBackround: ViewModifier {
    let color: Color
    var radius: CGFloat = 16
    var lineWidth: CGFloat = 1
    
    func body(content: Content) -> some View {
        content
            .overlay(
                RoundedRectangle(cornerRadius: radius)
                    .stroke(color, lineWidth: lineWidth)
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
    
    func asTGTitleText() -> some View {
        modifier(TGTitleText())
    }
    
    func asRoundedSecondaryBackround(_ color: Color = Color.secondBackground) -> some View {
        modifier(RoundedSecondaryBackround(color: color))
    }
    
    func asRoundedStrokeBackround(_ color: Color, radius: CGFloat = 16, lineWidth: CGFloat = 1) -> some View {
        modifier(RoundedStrokeBackround(color: color,
                                        radius: radius,
                                        lineWidth: lineWidth)
        )
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
