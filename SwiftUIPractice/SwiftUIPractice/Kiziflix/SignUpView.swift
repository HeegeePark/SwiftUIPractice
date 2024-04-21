//
//  SignUpView.swift
//  SwiftUIPractice
//
//  Created by 박희지 on 4/20/24.
//

import SwiftUI

struct SignUpView: View {
    @State private var inputId = ""
    @State private var inputPassword = ""
    @State private var inputNickname = ""
    @State private var inputLocation = ""
    @State private var inputCode = ""
    @State private var isOn = true
    @State private var isPresented = false
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack {
                logoView
                Spacer()
                inputAreaView
                Spacer()
            }
            .padding()
            .fullScreenCover(isPresented: $isPresented) {
                MainView(nickname: inputNickname)
            }
        }
    }
    
    var logoView: some View {
        Text("KIZIFLIX")
            .font(.title)
            .bold()
            .foregroundStyle(.red)
    }
    
    var inputAreaView: some View {
        VStack(spacing: 10) {
            SignUpTextFieldView(placeholder: "이메일 주소 또는 전화번호", input: $inputId)
            SignUpTextFieldView(placeholder: "비밀번호", input: $inputPassword)
            SignUpTextFieldView(placeholder: "닉네임", input: $inputNickname)
            SignUpTextFieldView(placeholder: "위치", input: $inputLocation)
            SignUpTextFieldView(placeholder: "추천코드입력", input: $inputCode)
            signInButton
            additinalInfoToggle
        }
        .padding()
    }
    
    var signInButton: some View {
        Button("회원가입") {
            print(inputNickname)
            guard !inputNickname.isEmpty else { return }
            isPresented = true
        }
        .font(.subheadline)
        .bold()
        .foregroundStyle(.black)
        .asMaxWidthBackground()
        .padding(.vertical, 12)
        .asRoundedSecondaryBackround(.white, radius: 4)
    }
    
    var additinalInfoToggle: some View {
        Toggle("추가 정보 입력", isOn: $isOn)
            .font(.subheadline)
            .foregroundStyle(.white)
            .tint(.red)
    }
}

#Preview {
    SignUpView()
}

struct SignUpTextFieldView: View {
    let placeholder: String
    @Binding var input: String
    
    var body: some View {
        TextField(
            "",
            text: $input,
            prompt: Text(placeholder)
                .font(.caption2)
                .foregroundStyle(.white)
        )
        .font(.caption2)
        .foregroundStyle(.black)
        .multilineTextAlignment(.center)
        .asMaxWidthBackground()
        .padding(.vertical, 8)
        .asRoundedSecondaryBackround(.secondary, radius: 4)
    }
}
