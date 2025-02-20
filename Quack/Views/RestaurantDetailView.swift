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
                    
                    RestaurantInfo(restaurant: restaurant, currentLocation: currentLocation)
                    
                    Spliter()
                    
                    Opinions()
                    
                    Spliter()
                    
                    BestMenu()
                    
                    Spliter()
                    
                    Menus(restaurant: restaurant)
                    
                    Spliter()
                    
                    // Reviews(reviews: restaurant.reviews)
                    
                    Spliter()
                    
                    Report()
                    
                    
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
                                
                                Text("10000")
                                //Text("\(restaurant.bookNum)")
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
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    RestaurantDetailView(restaurant: .constant(Restaurant(
        id: 1,
        userId: 1,
        name: "니카이 우동",
        address: "서울 성동구 성덕정17길 11 2층",
        category: RestaurantCategory.korean)
    ), currentLocation: .constant("왕십리"))
        .background(Color(hex:"#171714"))
}
