//
//  HomeView.swift
//  SwiftUIPractice
//
//  Created by 박희지 on 4/20/24.
//

import SwiftUI

struct HomeView: View {
    let nickname: String
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black.ignoresSafeArea()
                ScrollView() {
                    VStack {
                        headerView
                        previewAreaView
                    }
                    .frame(maxWidth: .infinity)
                    .frame(maxHeight: .infinity)
                }
            }
            .toolbar {
                ToolbarItemGroup(placement: .topBarLeading) {
                    Text("\(nickname) 님")
                        .bold()
                }
                ToolbarItemGroup(placement: .topBarTrailing) {
                    TabBarItemView(image: Image(systemName: "tv.badge.wifi"))
                    TabBarItemView(image: Image(systemName: "magnifyingglass"))
                    TabBarItemView(image: Image(.pink))
                }
            }
            .foregroundStyle(.white)
            .frame(maxHeight: .infinity)
        }
    }
    
    var headerView: some View {
        VStack {
            headerTopView
            Spacer()
            headerBottomView
        }
        .frame(height: 700)
        .background(
            headerBackgroundView
        )
    }
    
    var headerBackgroundView: some View {
        // TODO: 백그라운드 튀어나오는거 해결할 것
        Image(.poster)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .imageScale(.large)
            .overlay(
                Image(.background)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .imageScale(.large)
                    .opacity(0.4)
            )
    }
    
    var headerTopView: some View {
        HStack(spacing: 20) {
            Image(.singleLarge)
            Button("TV프로그램") { }
            Button("영화") { }
            Button("내가 찜한 콘텐츠") { }
        }
        .frame(maxWidth: .infinity)
        .foregroundStyle(.white)
        .font(.callout)
        .bold()
        .padding(.vertical, 10)
    }
    
    var headerBottomView: some View {
        HStack(spacing: 20) {
            setHeaderBottomButton(image: Image(systemName: "checkmark"), text: "내가 찜한 콘텐츠")
            playButton
            setHeaderBottomButton(image: Image(systemName: "info.circle"), text: "정보")
        }
        .font(.callout)
        .bold()
    }
    
    func setHeaderBottomButton(image: Image, text: String) -> some View {
        Button {
            print("click")
        } label: {
            VStack(spacing: 6) {
                image
                    .imageScale(.large)
                Text(text)
                    .font(.caption)
            }
            
        }
        .frame(alignment: .center)
        .frame(maxWidth: .infinity)
        .foregroundStyle(.white)
    }
    
    var playButton: some View {
        Button {
            
        } label: {
            HStack(spacing: 10) {
                Image(systemName: "play.fill")
                Text("재생")
                    .frame(width: 30)
            }
        }
        .padding(.vertical, 6)
        .padding(.horizontal, 50)
        .foregroundStyle(.black)
        .asRoundedSecondaryBackround(.white, radius: 8)
        .padding(.vertical, 20)
    }
    
    var previewAreaView: some View {
        VStack(alignment: .leading) {
            Text("미리보기")
                .bold()
            HStack(spacing: 20) {
                setPreviewImageView(image: Image(.poster))
                setPreviewImageView(image: Image(.poster))
                setPreviewImageView(image: Image(.poster))
            }
        }
        .padding(20)
    }
    
    func setPreviewImageView(image: Image) -> some View {
        image
            .resizable()
            .aspectRatio(1, contentMode: .fill)
            .clipShape(.circle)
            .overlay(
                Circle()
                    .stroke(.gray, lineWidth: 3)
            )
    }
}

struct TabBarItemView: View {
    let image: Image
    
    var body: some View {
        Button {
            print("탭바 아이템 클릭")
        } label: {
            image
        }
    }
}

#Preview {
    HomeView(nickname: "kizi")
}
