//
//  LiveRankingBlock.swift
//  Quack
//
//  Created by 차차 on 2/22/25.
//

import SwiftUI
/** Using in SearhView/LiveSearchRanking */
struct LiveRankingBlock: View {
    let restaurant: LiveRankingRestaurant

    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            ZStack(alignment: .top) {
                Image(.dummyMenu)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 64)

                VStack(alignment: .leading) {
                    Spacer()

                    HStack {
                        Text("\(restaurant.ranking)")
                            .font(.theJamsil(.number(700), size: 30))
                            .foregroundStyle(Color(hex: "#EFEEDF"))

                        Spacer()
                    }
                }
                .frame(width: 88, height: 71)
            }

            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(restaurant.name)
                        .font(.pretendard(.number(600), size: 16))
                        .foregroundStyle(Color(hex: "#D7D5C1"))

                    Text(restaurant.category)

                }
                Text(restaurant.description)

                Text("\(restaurant.distance)m | 평균 \(restaurant.avgPrice)원 | \(restaurant.isOpen ? "영업중" : "닫음")")

            }
            .foregroundStyle(Color(hex: "#A8A7A1"))
            .font(.pretendard(.number(500), size: 12))
        }
    }
}

#Preview {
    LiveRankingBlock(restaurant: LiveRankingRestaurant(ranking: 1, name: "고기천국", category: "분식", description: "1인 오너 쉐프가 운영하는 합리적인 가격의 가게", img: "", distance: 816, avgPrice: 8000, isOpen: true))
}
