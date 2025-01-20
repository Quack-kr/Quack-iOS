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
                Image(.chevronLeft)
                
                HStack {
                    TextField("장소, 가게 두드려보GO", text: $searchText)
                    
                    Image(.search)
                }
            }
            
            
        }
    }
}

#Preview {
    SearchView()
}
