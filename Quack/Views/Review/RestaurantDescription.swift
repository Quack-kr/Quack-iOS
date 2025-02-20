//
//  RestaurantDescription.swift
//  Quack
//
//  Created by 차차 on 2/17/25.
//

import SwiftUI

struct RestaurantDescription: View {
    let restaurantName: String
    let restaurantInfo: String
    
    var body: some View {
        HStack(spacing: 16) {
             Image(.camera) // TODO: 카메라 이미지 프레임과 렌즈 병합
                .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                .foregroundStyle(Color(hex:"#A8A7A1"))
                .padding(.horizontal, 18)
                .padding(.vertical, 20)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                )
            
            VStack(alignment: .leading, spacing: 7) {
                Text(restaurantName)
                    .textModifier(.theJamsil, 700, 14, "#EFEEDF")
                Text(restaurantInfo)
                    .textModifier(.pretendard, 500, 12, "#A8A7A1")
            }
            
            Spacer()
        }
        .padding(10)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .foregroundStyle(Color(hex:"#2A2925"))
        )
    }
}

#Preview {
    RestaurantDescription(restaurantName: "소문난 성수 감자탕", restaurantInfo: "일식 | 서울 성동구 성덕정17길 11 2층")
}
