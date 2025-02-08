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
                RoundedRectangle(cornerRadius: 8)
                    .frame(height: 139)
                    .foregroundStyle(.white)
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
                    
                    
                    Text("\(restaurant.now)")
                        .textModifier(.pretendard, 700, 12, .point)
                    
                    Text("•영업시간 \(restaurant.openTime)")
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
    RestaurantInfo(restaurant: Restaurant(name: "니카이 우동", address: "서울 성동구 성덕정17길 11 2층", category: "분식", now: "영업중", openTime: "10:00~22:00", menuList: [Menu(name: "자루우동", price: 10000)], reviews: [Review(userName: "금손 언데드 001", date: "2024.04.10", thumbnail: "", content: "자루우동은 진짜 맛있는데 니꾸우동은 그냥 먹어줄만 했어요...")], bookNum: 100000), currentLocation: "왕십리")
}
