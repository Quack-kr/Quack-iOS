//
//  SearchBar.swift
//  Quack
//
//  Created by 차차 on 2/8/25.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchingText: String
    var body: some View {
        HStack {
            Image(.chevronLeft)
            
            HStack {
                TextField(
                    "",
                    text: $searchingText,
                    prompt: Text("장소, 가게 두드려보GO")
                        .foregroundStyle(Color(hex:"#68675E"))
                )
                .foregroundStyle(Color(hex:"#EFEEDF"))
                .tint(.point)
                
                Button(action: {
                    if searchingText.isEmpty {
                        // TODO: 검색 기능
                    } else {
                        searchingText.removeAll()
                    }
                }) {
                    if searchingText.isEmpty {
                        Image(.search)
                            .frame(height: 18)
                    }
                    else {
                        Image(.eraseCircle)
                            .frame(height: 18)
                    }
                }
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .foregroundStyle(Color(hex:"#323230"))
            )
        }
    }
}

#Preview {
    SearchBar(searchingText: .constant(""))
}
