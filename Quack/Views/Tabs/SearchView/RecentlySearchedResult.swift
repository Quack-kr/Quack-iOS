//
//  RecentlySearchedResult.swift
//  Quack
//
//  Created by 차차 on 2/8/25.
//

import SwiftUI

struct RecentlySearchedResult: View {
    @Binding var searchedTextArr: [String]
    @Binding var searchingText: String
    @Binding var searchedShopArr: [SearchedShop]
    
    var body: some View {
        VStack(spacing: 14) { // Recently Searched Text
            HStack {
                Text("최근 검색어")
                    .textModifier(.theJamsil, 700, 14, "#EFEEDF")
                
                Spacer()
                
                if !searchedTextArr.isEmpty {
                    Button(action: { searchedTextArr.removeAll() }) {
                        Text("지우기")
                            .textModifier(.pretendard, 600, 12, "#D7D5C1")
                    }
                }
            }
            
            ScrollView(.horizontal) {
                HStack(spacing: 4) {
                    ForEach(searchedTextArr, id: \.self) { searchedText in
                        HStack {
                            Button(action: { searchingText = searchedText; }) {
                                Text(searchedText)
                                    .textModifier(.theJamsil, 700, 14, "#D7D5C1")
                            }
                            
                            Button(action: { searchedTextArr.remove(at: searchedTextArr.firstIndex(of: searchedText)!) }) {
                                Image(.erase)
                            }
                        }
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .foregroundStyle(Color(hex:"#2A2925"))
                        )
                    }
                }
            }
        }
        
        VStack(spacing: 14) { // Recently Searched Location
            HStack {
                Text("최근 검색 장소")
                    .textModifier(.theJamsil, 700, 14, "#EFEEDF")
                
                Spacer()
                
                if !searchedShopArr.isEmpty {
                    Button(action: { searchedShopArr.removeAll() }) {
                        Text("지우기")
                            .textModifier(.pretendard, 600, 12, "#D7D5C1")
                    }
                }
            }
            ScrollView(.horizontal) {
                HStack(spacing: 14) {
                    ForEach(searchedShopArr, id: \.self) { searchedShop in
                        Button(action: { searchingText = searchedShop.shopName; }) {
                            VStack(spacing: 8) {
                                Image(.dummyMenu) // TODO: 서버로부터 이미지 전송받기
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width:64)
                                
                                Text(searchedShop.shopName)
                                    .textModifier(.pretendard, 600, 12, "#D7D5C1")
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    RecentlySearchedResult(searchedTextArr: .constant([]), searchingText: .constant(""), searchedShopArr: .constant([]))
}
