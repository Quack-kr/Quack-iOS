//
//  SearchView.swift
//  Quack
//
//  Created by 차승훈 on 1/19/25.
//

import SwiftUI

struct SearchView: View {
    @State private var searchingText = "";
    @State private var searchedTextArr = [String]();
    @State private var searchedShopArr = [SearchedShop]();
    
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                SearchBar(searchingText: $searchingText)
                
                RecentlySearchedResult(searchedTextArr: $searchedTextArr, searchingText: $searchingText, searchedShopArr: $searchedShopArr)
                
                LiveSearchRanking()
                
                Spacer()
            }
            .padding(.horizontal, 16)
        }
    }
}

#Preview {
    SearchView()
        .background(Color.background)
}
