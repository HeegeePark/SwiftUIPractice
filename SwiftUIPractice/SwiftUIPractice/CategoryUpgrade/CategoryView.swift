//
//  CategoryView.swift
//  SwiftUIPractice
//
//  Created by 박희지 on 4/22/24.
//

import SwiftUI

struct Category: Hashable, Identifiable {
    let id = UUID()     // 안쓸건데, 같은 데이터들도 고유하게 만들기 위해 구현
    let name: String
    let count: Int
}

struct CategoryView: View {
    let genres = ["SF", "스릴러", "가족", "애니메이션", "로맨스"]
    @State var category: [Category] = [
        Category(name: "스릴러", count: 1),
        Category(name: "스릴러", count: 1),
        Category(name: "스릴러", count: 2),
        Category(name: "로맨스", count: 4),
        Category(name: "애니메이션", count: 5)
    ]
    
    @State private var query = ""
    
    var filterCategory: [Category] {
        return query.isEmpty ? category: category.filter {
            $0.name.contains(query)
        }
    }
    
    func setupRows(_ category: Category) -> some View {
        HStack {
            Image(systemName: "tv")
            Text(category.name)
            Text("\(category.count)")
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(filterCategory, id: \.self) { value in
                    NavigationLink {
                        SearchDetailView(category: value)
                    } label: {
                        setupRows(value)
                    }
                }
            }
            .navigationTitle("영화 검색")
            .searchable(text: $query,
                        placement: .navigationBarDrawer,
                        prompt: "영화를 검색해보세요.")
            .toolbar {
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button("추가") {
                        category.append(
                            Category(name: genres.randomElement()!,
                                     count: .random(in: 1...100))
                        )
                    }
                }
            }
        }
    }
}

struct SearchDetailView: View {
    
    let category: Category
    
    var body: some View {
        Text("디테일 화면: \(category.name), \(category.count)")
    }
}

#Preview {
    CategoryView()
}
