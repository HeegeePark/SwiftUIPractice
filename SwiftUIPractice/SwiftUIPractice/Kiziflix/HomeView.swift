//
//  HomeView.swift
//  SwiftUIPractice
//
//  Created by 박희지 on 4/20/24.
//

import SwiftUI

struct HomeView: View {
    let nickname: String
//    let sections = [
//        KiziFlixSection(
//            title: "몰아보기 추천! SF & 판타지 시리즈",
//            images: { RandomImage.randomImages(count: 5) }
//        ),
//        KiziFlixSection(
//            title: "초자연 현상을 다룬 한국 시리즈",
//            images: { RandomImage.randomImages(count: 5) }
//        ),
//        KiziFlixSection(
//            title: "흥미진진한 한국 드라마",
//            images: { RandomImage.randomImages(count: 5) }
//        )
//    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black.ignoresSafeArea()
                ScrollView() {
                    VStack {
                        headerView
                        previewAreaView
                        // TODO: ForEach로 개선하기
                        PosterSectionView(
                            title: "몰아보기 추천! SF & 판타지 시리즈",
                            images: { RandomImage.randomImages(count: 5) }
                        )
                        PosterSectionView(
                            title: "초자연 현상을 다룬 한국 시리즈",
                            images: { RandomImage.randomImages(count: 5) }
                        )
                        PosterSectionView(
                            title: "흥미진진한 한국 드라마",
                            images: { RandomImage.randomImages(count: 5) }
                        )
//                        ForEach(sections, id: \.self) { value in
//                            PosterSectionView(section: value)
//                        }
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
        .padding(10)
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

struct PosterSectionView<T: View>: View {
    init(title: String, images: @escaping () -> [T]) {
        self.title = title
        self.images = images()
    }
    
    @State private var title: String
    let images: [T]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .padding(4)
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(0..<images.count) { idx in
                        NavigationLink {
                            // TODO: 상세화면에서 랜덤이미지 호출 막기
                            HomeDetailView(sectionTitle: $title) {
                                images[idx]
                            }
                        } label: {
                            images[idx]
                        }
                    }
                }
            }
            .scrollIndicators(.hidden)
        }
    }
    
//    let section: KiziFlixSection<some View>
    
//    var body: some View {
//        VStack(alignment: .leading) {
//            Text(section.title)
//                .padding(4)
//            ScrollView(.horizontal) {
//                ForEach(0..<section.images.count) { idx in
//                    NavigationLink {
//                        TamagochiView()
//                    } label: {
////                        PosterImageView(image: section.images[idx])
//                        section.images[idx]
//                    }
//                }
//            }
//            .scrollIndicators(.hidden)
//        }
//    }
}

enum RandomImage {
    private static let url = URL(string: "https://picsum.photos/200/300")
    
    static func randomImages(count: Int) -> [some View] {
        return Array(0..<count).map { _ in
            randomImage
        }
    }
    
    private static var randomImage: some View {
        AsyncImage(url: url) { data in
            switch data {
            case .empty:
                ProgressView()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 160)
                    .clipShape(.rect(cornerRadius: 4))
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 160)
                    .clipShape(.rect(cornerRadius: 4))
            case .failure(let error):
                Color.white
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 160)
                    .clipShape(.rect(cornerRadius: 4))
            @unknown default:
                Color.white
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 160)
                    .clipShape(.rect(cornerRadius: 4))
            }
        }
    }
}

//struct KiziFlixSection<T: View>: Hashable {
//    static func == (lhs: KiziFlixSection<T>, rhs: KiziFlixSection<T>) -> Bool {
//        return lhs.id == rhs.id
//    }
//    
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(id)
//    }
//    
//    init(title: String, images: @escaping () -> [T]) {
//        self.title = title
//        self.images = images()
//    }
//    
//    let id = UUID()
//    let title: String
//    let images: [T]
//}
            
#Preview {
    HomeView(nickname: "kizi")
}
