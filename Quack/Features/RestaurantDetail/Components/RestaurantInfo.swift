//
//  RestaurantInfo.swift
//  Quack
//
//  Created by 차차 on 2/8/25.
//

import SwiftUI

struct RestaurantInfo: View {
    let restaurant: Restaurant
    let currentLocation: String

    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(restaurant.name)
                        .textModifier(.theJamsil, 700, 18, "#EFEEDF")

                    Text("동네 맛집 1위   \(restaurant.category) | \(currentLocation)") // TODO: 글씨 색상 변경
                        .textModifier(.pretendard, 500, 12, .point)
                }

                Spacer()
            }
            .padding(.bottom, 16)

            /** Map View */
            VStack {
                NaverMapView()
                    .cornerRadius(8)
                    .frame(height: 139)
            }
            .padding(.bottom, 12)

            VStack(spacing: 8) {
                HStack(spacing: 8) {
                    Image(.address)

                    Text(restaurant.address)
                        .textModifier(.pretendard, 500, 12, "#A8A7A1")

                    Spacer()
                }

                HStack(spacing: 8) {
                    Image(.clock)

                    Text("영업중")
                    // Text("\(restaurant.now)")
                        .textModifier(.pretendard, 700, 12, .point)

                    Text("영업 시간")
                    // Text("•영업시간 \(restaurant.openTime)")
                        .textModifier(.pretendard, 500, 12, "#A8A7A1")

                    Image(.chevronUp)

                    Spacer()
                }
            }
            .padding(.bottom, 16)
        }
        .padding(.horizontal, 16)
        .background(Color(hex: "#171714"))
    }
}

#Preview {
    RestaurantInfo(restaurant: Restaurant(
        id: 1,
        name: "니카이 우동",
        address: "서울 성동구 성덕정17길 11 2층",
        category: RestaurantCategory.korean,
        reviewList: [],
        menuList: []
    ), currentLocation: "왕십리")
}
