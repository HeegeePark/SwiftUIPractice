//
//  AgreementView.swift
//  SwiftUIPractice
//
//  Created by 박희지 on 4/15/24.
//

import SwiftUI

struct AgreementView: View {
    var body: some View {
        ZStack(alignment: .leading) {
            Color(.background).ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 200) {
                VStack(alignment: .leading, spacing: 30) {
                    Image(.firework)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                    
                    Text("포인트를 더 모을 수 있게 맞춤 혜택을 추천해드릴까요?")
                        .font(.title3)
                        .bold()
                        .foregroundStyle(.foreground)
                    
                    HStack {
                        Image(.chulcheck)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                        
                        Text("매일 포인트 받는 출석체크•퀴즈")
                            .font(.system(size: 16))
                            .foregroundStyle(.secondary)
                    }
                    
                    HStack {
                        Image(.event)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                        
                        Text("새로운 이벤트")
                            .font(.system(size: 16))
                            .foregroundStyle(.secondary)
                    }
                    
                    HStack {
                        Image(.mission)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                        
                        Text("미션 추천")
                            .font(.system(size: 16))
                            .foregroundStyle(.secondary)
                    }
                }
                
                VStack(alignment: .center, spacing: 30) {
                    Button("[선택] 맞춤형 서비스 이용 안내") { }
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    
                    Button("동의하기") { }
                        .padding()
                        .font(.system(size: 16))
                        .foregroundStyle(.white)
                        .bold()
                        .background(.blue)
                        .clipShape(.buttonBorder)
                        .frame(width: 300, height: 50)
                        
                    
                    Button("다음에 하기") { }
                        .padding()
                        .font(.system(size: 16))
                        .foregroundStyle(.secondary)
                        .frame(width: 200, height: 50)
                }
            }
            .padding()
        }
    }
}

#Preview {
    AgreementView()
}
