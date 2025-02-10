//
//  RestaurantDetail.swift
//  Quack
//
//  Created by 차차 on 2/8/25.
//

import SwiftUI

struct RestaurantDetailView: View {
    @Binding var restaurant: Restaurant
    @Binding var currentLocation: String
    
    var body: some View {
        ScrollViewReader { reader in
            ScrollView {
                VStack(spacing: 0) {
                    RestaurantDetailHeader(restaurantName: restaurant.name)
                        .id("top")
                    
                    VStack(spacing: 10) {
                        RestaurantInfo(restaurant: restaurant, currentLocation: currentLocation)
                        
                        Opinions()
                        
                        BestMenu()
                        
                        Menus(restaurant: restaurant)
                        
                        Reviews(reviews: restaurant.reviews)
                        
                        Report()
                    }
                    
                    Button(action: {
                        withAnimation {
                            reader.scrollTo("top", anchor: .top)
                        }
                    }) {
                        VStack(spacing: 10) {
                             Image(.arrowUp)
                            
                            Text("맨위로 슝")
                                .textModifier(.theJamsil, 700, 14, "#EFEEDF")
                        }
                    }
                    .padding(.vertical, 32)
                    
                    HStack {
                        Button(action: {}) {
                            VStack {
                                Image(.book)
                                    .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                                
                                Text("\(restaurant.bookNum)")
                            }
                            .textModifier(.pretendard, 700, 12, "#EFEEDF")
                            .padding(.vertical, 8)
                            .padding(.horizontal, 32)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .foregroundStyle(Color(hex:"#525250"))
                            )
                        }
                        
                        Button(action: {}) {
                            Text("리뷰 남겨보기")
                                .pointColorButtonTextModifier()
                        }
                    }
                    .padding(.horizontal, 16)
                }
                
                Spacer()
            }
            .edgesIgnoringSafeArea(.top)
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    RestaurantDetailView(restaurant: .constant(Restaurant(name: "니카이 우동", address: "서울 성동구 성덕정17길 11 2층", category: "분식", now: "영업중", openTime: "10:00~22:00", menuList: [Menu(name: "자루우동", price: 10000)], reviews: [Review](repeating: Review(userName: "금손 언데드 001", date: "2024.04.10", thumbnail: "", content: "자루우동은 진짜 맛있는데 니꾸우동은 그냥 먹어줄만 했어요..."), count: 3), bookNum: 100000)), currentLocation: .constant("왕십리"))
        .background(Color.background)
}
