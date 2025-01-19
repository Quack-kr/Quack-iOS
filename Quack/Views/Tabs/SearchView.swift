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
            HStack {
                Image(.rightShevron) // TODO: left shevron 이미지 추가
                
                HStack {
                    TextField("장소, 가게 두드려보GO", text: $searchText)
                    
                    Image(.checkCircle) // TODO: 검색 이미지 추가
                }
            }
            
            
        }
    }
}

#Preview {
    SearchView()
}
