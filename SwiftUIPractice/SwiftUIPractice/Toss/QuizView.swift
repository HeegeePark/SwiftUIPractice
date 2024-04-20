//
//  QuizView.swift
//  SwiftUIPractice
//
//  Created by 박희지 on 4/16/24.
//

import SwiftUI

struct QuizView: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 20) {
                iceImageArea
                textArea(text: "등기부등본은 집주인만 발급받을 수 있다?", style: .title)
                textArea(text: "매일 푸는 금융 퀴즈 290,300명 참여중", style: .sub)
                AnswerSelectArea()
            }
            .padding(20)
            .asRoundedSecondaryBackround()
            .padding()
            
        }
    }
    
    var iceImageArea: some View {
        HStack {
            ImageView(image: .ice,
                      width: 50,
                      height: 50)
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    func textArea(text: String, style: TextStyle) -> some View {
        style.set(content: Text(text))
    }
}

struct AnswerSelectArea: View {
    var body: some View {
        HStack(spacing: 16) {
            buttonView(.o)
            buttonView(.x)
        }
        .frame(maxWidth: .infinity)
    }
    
    func buttonView(_ type: QuizType) -> some View {
        Button {} label: {
            VStack(spacing: 0) {
                ImageView(image: type.image,
                          width: 35,
                          height: 35)
                
                Text(type.text)
                    .padding()
                    .font(.callout)
                    .bold()
                    .foregroundStyle(type.foregroundColor)
            }
            .padding(EdgeInsets(top: 20, leading: 0, bottom: 12, trailing: 0))
        }
        .frame(maxWidth: .infinity)
        .asRoundedSecondaryBackround(type.backgroundColor)
    }
    
    enum QuizType {
        case o
        case x
        
        var image: ImageResource {
            switch self {
            case .o: .o
            case .x: .x
            }
        }
        
        var text: String {
            switch self {
            case .o: "그렇다"
            case .x: "아니다"
            }
        }
        
        var foregroundColor: Color {
            switch self {
            case .o: .blue
            case .x: .red
            }
        }
        
        var backgroundColor: Color {
            switch self {
            case .o: .blue.opacity(0.2)
            case .x: .red.opacity(0.15)
            }
        }
    }
}

#Preview {
    QuizView()
}
