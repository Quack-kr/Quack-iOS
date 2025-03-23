//
//  SearchView.swift
//  Quack
//
//  Created by 차승훈 on 1/19/25.
//

import SwiftUI

struct SearchView: View {
    @State private var searchingText = ""
    // TODO: 이전 검색 결과 처리하는 객체 생성하기 - 추가적으로 SwiftData를 활용해서 캐싱할 수 있을 듯 (이 때 캐시와 서버 동기화 문제 고려하기 - SwiftData에는 저장되었지만 서버에는 업데이트 되지 않은 경우)
    @State private var searchedTextArr = [String]()
    @State private var searchedShopArr = [SearchedShop]()

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
