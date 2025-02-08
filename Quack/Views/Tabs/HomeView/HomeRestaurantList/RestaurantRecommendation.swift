//
//  RestaurantRecommendation.swift
//  Quack
//
//  Created by 차차 on 2/8/25.
//

import SwiftUI

struct RestaurantRecommendation: View {
    var body: some View {
        VStack {
            HStack {
                Text("뭐 먹을지 고민될땐")
                    .textModifier(.theJamsil, 700, 18, "#EFEEDF")
                
                Spacer()
            }
            
            /* Thumbnail Image Area */
            ZStack(alignment: .bottom) {
                    Image(.dummyThumbnail)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                        .overlay(
                            LinearGradient(gradient: Gradient(colors: [Color(hex:"#171714").opacity(0), Color(hex:"#171714").opacity(1)]), startPoint: .top, endPoint: .bottom)
                        )
                
                HStack(alignment: .bottom) {
                    VStack(alignment: .leading) {
                        Text("니카이 우동")
                            .textModifier(.theJamsil, 700, 20, .white)
                        
                        Text("우동 한 그릇 위에 정성을 쌓다.")
                            .textModifier(.theJamsil, 400, 16, "#EFEEDF")
                    }
                    
                    Spacer()
                    
                    Text("광고 ⓘ")
                        .textModifier(.pretendard, 500, 10, "#EFEEDF")
                }
                .padding(16)
            }
            
            /* Individual Menu Section */
            VStack {
                HStack {
                    Image(.dummyMenu)
                    
                    VStack(alignment: .leading) {
                        Text("자루우동")
                            .textModifier(.theJamsil,700,16, "#EFEEDF")
                        
                        Text("우동사리와 함꼐 바삭은 추가하면 딱이지")
                            .textModifier(.pretendard,500,12,"#A8A7A1")
                        
                        Text("10,000원")
                            .textModifier(.pretendard,600,12,"#A8A7A1")
                    }
                    
                    Spacer()
                    
                    VStack {
                        Text("999+")
                            .textModifier(.pretendard,800,14,.point)
                        
                        Text("미친맛")
                            .textModifier(.pretendard,600, 12, "#EFEEDF")
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .foregroundStyle(Color(hex:"#323230"))
                            )
                    }
                }
            }
        }
    }
}

#Preview {
    RestaurantRecommendation()
}
