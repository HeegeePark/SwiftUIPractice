//
//  MenuView.swift
//  SwiftUIPractice
//
//  Created by 박희지 on 4/17/24.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            HStack(spacing: -16) {
                Form {
                    Section {
                        Image(.bank)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 35, height: 35)
                        
                        Text("토스뱅크")
                            .bold()
                    }
                    .listRowSeparator(.hidden)
                    .frame(maxWidth: .infinity, alignment: .center)
                }
                
                Form {
                    Section {
                        Image(.graph)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 35, height: 35)
                        
                        Text("토스증권")
                            .bold()
                    }
                    .listRowSeparator(.hidden)
                    .frame(maxWidth: .infinity, alignment: .center)
                }
                
                Form {
                    Section {
                        Image(.headset)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 35, height: 35)
                        
                        Text("고객센터")
                            .bold()
                    }
                    .listRowSeparator(.hidden)
                    .frame(maxWidth: .infinity, alignment: .center)
                }
            }
        }
    }
}

#Preview {
    MenuView()
}
