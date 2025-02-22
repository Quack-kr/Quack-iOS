//
//  ReviewWritingView.swift
//  Quack
//
//  Created by 차차 on 2/17/25.
//

import SwiftUI

struct ReviewWritingView: View {
    var body: some View {
        VStack {
            ReviewHeader()
                .padding(.bottom, 32)

            RestaurantDescription(restaurantName: "가게 이름", restaurantInfo: "가게 정보")
                .padding(.bottom, 32)

            ReviewContent()

            VStack {
                Button(action: {

                }, label: {
                    Text("다음")
                        .textModifier(.pretendard, 700, 18, "#171714")
                        .padding(.horizontal, 98)
                        .padding(.vertical, 15)
                        .background(
                            RoundedRectangle(cornerRadius: 26)
                                .foregroundStyle(.point)
                        )
                })
            }
            .frame(maxWidth: .infinity)
            .padding(.top, 8)
            .background(Color.background)
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    ReviewWritingView()
        .background(Color.background)
}
