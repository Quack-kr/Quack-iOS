//
//  Menus.swift
//  Quack
//
//  Created by 차차 on 2/8/25.
//

import SwiftUI

struct Menus: View {
    let restaurant: Restaurant
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("메뉴")
                .textModifier(.theJamsil, 700, 18, "#EFEEDF")
            
            ScrollView(.horizontal) {
                HStack(spacing: 8) {
                    ForEach(restaurant.menuList, id: \.self) { menu in
                        VStack {
                            Text(menu.name)
                                .textModifier(.pretendard, 700, 14, "#EFEEDF")
                            
                            Text("\(menu.price)원") // TODO: 숫자 표기 함수 생성 10000 -> 10,000
                                .textModifier(.pretendard, 600, 12, "#A8A7A1")
                        }
                        .padding(.horizontal, 22.5)
                        .padding(.vertical, 10)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .foregroundStyle(Color(hex: "#323230"))
                        )
                    }
                }
            }
            
            Button(action: {}) {
                Text("메뉴판 보기")
                    .frame(maxWidth: .infinity)
                    .textModifier(.theJamsil, 700, 14, "#EFEEDF")
                    .padding(.vertical, 12)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color(hex:"#EFEEDF"), lineWidth: 1)
                    )
            }
            .padding(.trailing, 16)
        }
        .padding(.leading, 16)
        .restaurantDetailComponentBackgroundModifier()
    }
}

#Preview {
    Menus(restaurant: Restaurant(name: "니카이 우동", address: "서울 성동구 성덕정17길 11 2층", category: "분식", now: "영업중", openTime: "10:00~22:00", menuList: [Menu(name: "자루우동", price: 10000)], reviews: [Review(userName: "금손 언데드 001", date: "2024.04.10", thumbnail: "", content: "자루우동은 진짜 맛있는데 니꾸우동은 그냥 먹어줄만 했어요...")], bookNum: 100000))
}
