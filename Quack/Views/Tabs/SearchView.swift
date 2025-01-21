//
//  SearchView.swift
//  Quack
//
//  Created by 차승훈 on 1/19/25.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = "";
    
    var body: some View {
        VStack {
            /* Search Bar */
            HStack {
                Image(.chevronLeft)
                
                HStack {
                    TextField(
                        "",
                        text: $searchText,
                        prompt: Text("장소, 가게 두드려보GO")
                            .foregroundStyle(Color(hex:"#68675E"))
                    )
                        .foregroundStyle(Color(hex:"#EFEEDF"))
                        .tint(.point)
                    
                    Button(action: {}) {
                        Image(.search)
                            .frame(height: 18)
                    }
                }
                .padding(.vertical, 10)
                .padding(.horizontal, 16)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundStyle(Color(hex:"#323230"))
                )
            }
            
            /* Recently Searched Text*/
            
            
            /* Recently Searched Location */
            
            /* Live Search Ranking */
            
            Spacer()
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    SearchView()
        .background(Color.background)
}
