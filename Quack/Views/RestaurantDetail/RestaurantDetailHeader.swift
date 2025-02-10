//
//  RestaurantDetailHeader.swift
//  Quack
//
//  Created by 차차 on 2/9/25.
//

import SwiftUI

struct RestaurantDetailHeader: View {
    let restaurantName: String
    
    var body: some View {
        VStack(spacing: 8) {
            VStack(spacing: 24) {
                /** Substract Header */
                HStack(spacing: 16) {
                    Image(.chevronLeft)
                    
                    Text("\(restaurantName)")
                        .textModifier(.theJamsil, 700, 20, "#EFEEDF")
                    
                    Spacer()
                    
                    Button(action:{ }){
                        Image(.share)
                    }
                    
                    Button(action:{}){
                        Image(.book)
                            .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                            .foregroundStyle(Color(hex:"#EFEEDF"))
                    }
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 32)
            }
            .padding(.top, 70)
            .background(
                Rectangle()
                    .foregroundStyle(Color(hex:"#171714"))
            )
        }
    }
}

#Preview {
    RestaurantDetailHeader(restaurantName: "니카이 우동")
}
