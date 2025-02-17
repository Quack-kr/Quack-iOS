//
//  SubstractBanner.swift
//  Quack
//
//  Created by 차차 on 2/8/25.
//

import SwiftUI

struct SubstractBanner: View {
    var body: some View {
        VStack(spacing: 24) {
            HStack(alignment: .bottom) {
                Text(
                """
                싫어하는 걸
                싹 빼고
                시작하자.
                """
                )
                .textModifier(.theJamsil, 700, 40, "#EFEEDF")
                .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                
                Spacer()
                
                Text(
                """
                꽥은 당신이
                뭘 먹고 싶은지
                묻지 않아요
                """
                )
                .textModifier(.pretendard, 700, 22, "#323230")
                .multilineTextAlignment(.trailing)
            }
            .padding(.top, 24)
            .padding(.horizontal, 16)
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach(0 ..< FOOD_CATEGORY.count) { ind in
                        Button(action: {}) {
                            VStack {
                                Image(.chicken)
                                    .frame(height: 36)
                                    .padding(9)
                                    .background(
                                        Circle()
                                            .foregroundStyle(Color(hex:"#2A2925"))
                                        
                                    )
                                
                                Text(FOOD_CATEGORY[ind])
                                    .textModifier(.pretendard,600,12,"#EFEEDF")
                            }
                        }
                    }
                }
                .padding(.leading, 16)
            }
            .scrollIndicators(.hidden)
            .padding(.bottom, 16)
        }
        .background(
            Rectangle()
                .foregroundStyle(Color(hex:"#171714"))
                .ignoresSafeArea(edges: .top)
        )
    }
}

#Preview {
    SubstractBanner()
}
