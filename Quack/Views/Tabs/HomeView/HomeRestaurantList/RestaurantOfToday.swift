//
//  RestaurantOfToday.swift
//  Quack
//
//  Created by 차차 on 2/8/25.
//

import SwiftUI

struct RestaurantOfToday: View {
    var body: some View {
        VStack {
            HStack {
                Text("엄선한 오늘의 가게") // TODO: Check Font Size
                    .textModifier(.theJamsil, 700, 18, "#EFEEDF")
                
                Spacer()
                
                Image(.chevronRight)
            }
            ScrollView(.horizontal) {
                HStack {
                    VStack(alignment: .leading) {
                        Image(.dummyMenu)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 140)
                        
                        VStack(alignment: .leading) {
                            Text("김밥천국")
                                .textModifier(.pretendard, 600, 14, "#EFEEDF")
                            
                            Text("분식 | 왕십리")
                                .textModifier(.pretendard, 600, 12, "#A8A7A1")
                            
                            HStack {
                                Text("816m")
                                    .foregroundStyle(.point)
                                
                                Text("평균 28,000원")
                                    .foregroundStyle(Color(hex:"#A8A7A1"))
                            }
                                .font(.pretendard(.number(600), size: 12))
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    RestaurantOfToday()
}
