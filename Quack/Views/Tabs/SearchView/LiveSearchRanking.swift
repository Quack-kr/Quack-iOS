//
//  LiveSearchRanking.swift
//  Quack
//
//  Created by 차차 on 2/8/25.
//

import SwiftUI

struct LiveSearchRanking: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("실시간 검색 순위")
                .font(.theJamsil(.number(700), size: 14))
                .foregroundStyle(Color(hex: "#EFEEDF"))
            
            VStack(spacing: 16) {
                ForEach(0 ..< 5) { ind in
                    LiveRankingBlock(restaurant: LiveRankingRestaurant(ranking: ind, name: "이름", category: .bunsik, description: "설명", img: "", distance: 0, avgPrice: 0, isOpen: false))
                }
            }
        }
    }
}

#Preview {
    LiveSearchRanking()
        .background(Color.background)
}
