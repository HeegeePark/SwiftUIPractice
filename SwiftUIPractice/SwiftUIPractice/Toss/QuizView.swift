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
                HStack {
                    Image(.ice)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                    Spacer()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("등기부등본은 집주인만 발급받을 수 있다?")
                    .font(.title2)
                    .bold()
                    .foregroundStyle(.foreground)
                
                Text("매일 푸는 금융 퀴즈 290,300명 참여중")
                    .font(.callout)
                    .foregroundStyle(.secondary)
                
                HStack(spacing: 16) {
                    Button {} label: {
                        VStack(spacing: 0) {
                            Image(.o)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 35, height: 35)
                            
                            Text("그렇다")
                                .padding()
                                .font(.callout)
                                .bold()
                                .foregroundStyle(.blue)
                        }
                        .padding(EdgeInsets(top: 20, leading: 0, bottom: 12, trailing: 0))
                    }
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(.blue.opacity(0.2))
                            .frame(maxWidth: .infinity)
                    )
                    
                    Button {} label: {
                        VStack(spacing: 0) {
                            Image(.x)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 35, height: 35)
                            
                            Text("아니다")
                                .padding()
                                .font(.callout)
                                .bold()
                                .foregroundStyle(.red)
                        }
                        .padding(EdgeInsets(top: 20, leading: 0, bottom: 12, trailing: 0))
                    }
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(.red.opacity(0.15))
                            .frame(maxWidth: .infinity)
                    )
                }
                .frame(maxWidth: .infinity)
            }
            .padding(20)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(.secondBackground)
            )
            .padding()
            
        }
    }
}

#Preview {
    QuizView()
}
