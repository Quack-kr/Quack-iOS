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
//                LiveRankingBlock()
//
//                LiveRankingBlock()
            }
        }
    }
}

#Preview {
    LiveSearchRanking()
        .background(Color.background)
}
