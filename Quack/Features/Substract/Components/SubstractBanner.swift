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
                Text(SubstractBannerTitle)
                .textModifier(.theJamsil, 700, 40, "#EFEEDF")
                .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)

                Spacer()

                Text(SubstractBannerSubtitle)
                .textModifier(.pretendard, 700, 22, "#323230")
                .multilineTextAlignment(.trailing)
            }
            .padding(.top, 24)
            .padding(.horizontal, 16)

            ScrollView(.horizontal) {
                HStack {
                    ForEach(FoodCategory.allCases, id: \.self) { category in
                        Button(action: {}, label: {
                            VStack {
                                Image(.chicken)
                                // Image(category)
                                    .frame(height: 36)
                                    .padding(9)
                                    .background(
                                        Circle()
                                            .foregroundStyle(Color(hex: "#2A2925"))
                                    )

                                Text("\(category.rawValue)")
                                    .textModifier(.pretendard, 600, 12, "#EFEEDF")
                            }
                        })
                    }
                }
                .padding(.leading, 16)
            }
            .scrollIndicators(.hidden)
            .padding(.bottom, 16)
        }
        .background(
            Rectangle()
                .foregroundStyle(Color(hex: "#171714"))
                .ignoresSafeArea(edges: .top)
        )
    }
}

#Preview {
    SubstractBanner()
}
