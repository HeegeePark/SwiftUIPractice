//
//  TamagochiView.swift
//  SwiftUIPractice
//
//  Created by 박희지 on 4/20/24.
//

import SwiftUI

struct TamagochiView: View {
    @State private var riceCount = 0
    @State private var waterCount = 0
    
    var body: some View {
        VStack(spacing: 30) {
            infoView
            FeedView(type: .rice, output: $riceCount)
            FeedView(type: .water, output: $waterCount)
        }
    }
    
    var infoView: some View {
        VStack {
            Text("방실방실 다마고치")
                .asTGTitleText()
            .asRoundedStrokeBackround(.black, radius: 4)
            ResultView(riceCount: $riceCount, waterCount: $waterCount)
        }
    }
}

struct ResultView: View {
    @Binding var riceCount: Int
    @Binding var waterCount: Int
    
    var body: some View {
        Text("LV1 • 밥알 \(riceCount)개 • 물방울 \(waterCount)개")
            .asTGTitleText()
    }
}

struct FeedView: View {
    let type: FeedType
    @Binding var output: Int
    @State var input: String = ""
    
    var body: some View {
        HStack {
            UnderlineTextFieldView(textField: TextField(type.placeholder, text: $input))
            Button {
                guard let food = Int(input), food < type.max else {
                    if input.isEmpty {
                        output += 1
                    }
                    input = ""
                    return
                }
                output += food
                input = ""
            } label: {
                HStack {
                    Image(systemName: type.image)
                    Text(type.title)
                }
                .asTGTitleText()
                .asRoundedStrokeBackround(.black, radius: 4)
            }
        }
        .padding(.horizontal, 20)
    }
}

struct UnderlineTextFieldView: View {
    let textField: TextField<Text>
    
    var body: some View {
        VStack {
            textField
                .padding(.horizontal, 10)
                .multilineTextAlignment(.center)
            Rectangle()
                .frame(height: 1)
                .foregroundStyle(.black)
                .padding(.horizontal, 10)
        }
    }
}

enum FeedType: String {
    case rice = "밥"
    case water = "물"
    
    var placeholder: String {
        return "\(self.rawValue)주세용"
    }
    
    var title: String {
        return "\(self.rawValue)먹기"
    }
    
    var image: String {
        switch self {
        case .rice:
            return "leaf.circle"
        case .water:
            return "drop.circle"
        }
    }
    
    var max: Int {
        switch self {
        case .rice:
            return 100
        case .water:
            return 50
        }
    }
}

#Preview {
    TamagochiView()
}
