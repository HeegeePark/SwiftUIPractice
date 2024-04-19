//
//  AgreementView.swift
//  SwiftUIPractice
//
//  Created by 박희지 on 4/15/24.
//

import SwiftUI

struct AgreementView: View {
    var body: some View {
        ZStack() {
            Color(.background).ignoresSafeArea()
            VStack() {
                HStack {
                    VStack(alignment: .leading, spacing: 30) {
                        fireworkImage
                        title
                        BenefitView(image: .chulcheck, text: "매일 포인트 받는 출석체크•퀴즈")
                        BenefitView(image: .event, text: "새로운 이벤트")
                        BenefitView(image: .mission, text: "미션 추천")
                    }
                    Spacer()
                }
                Spacer()
                
                VStack(alignment: .center, spacing: 30) {
                    termsButton
                    agreeButton()
                    agreeButton(style: .cancel)
                }
            }
            .padding()
        }
    }
    
    var fireworkImage: some View {
        Image(.firework)
            .resizable()
            .scaledToFit()
            .frame(width: 50, height: 50)
    }
    
    var title: some View {
        Text("포인트를 더 모을 수 있게 맞춤 혜택을 추천해드릴까요?")
            .asTitleText()
    }
    
    var termsButton: some View {
        Button("[선택] 맞춤형 서비스 이용 안내") { }
            .font(.callout)
            .foregroundStyle(.primary)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    func agreeButton(style: AgreeButtonStyle = .default) -> some View {
        Button(style.title) { }
            .padding()
            .font(.system(size: 16))
            .foregroundStyle(style.foregroundColor)
            .asMaxWidthBackground()
            .background(style.backgroundColor)
            .clipShape(.buttonBorder)
    }
    
    enum AgreeButtonStyle {
        case `default`
        case cancel
        
        var title: String {
            switch self {
            case .default:
                "동의하기"
            case .cancel:
                "다음에 하기"
            }
        }
        
        var foregroundColor: Color {
            switch self {
            case .default:
                return .white
            case .cancel:
                return .secondary
            }
        }
        
        var backgroundColor: Color {
            switch self {
            case .default:
                return .blue
            case .cancel:
                return .clear
            }
        }
    }
}

struct BenefitView: View {
    let image: ImageResource
    let text: String
    
    var body: some View {
        HStack {
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
            
            Text(text)
                .font(.system(size: 16))
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    AgreementView()
}
