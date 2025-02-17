//
//  RestaurantListRanking.swift
//  Quack
//
//  Created by 차차 on 2/8/25.
//

import SwiftUI

struct RestaurantListRanking: View {
    var body: some View {
        VStack {
            HStack {
                Text("급상승 가게 TOP10")
                    .textModifier(.theJamsil, 700, 18, "#EFEEDF") // TODO: 폰트 사이즈 체크
                
                Spacer()
                
                Image(.chevronRight)
            }
            
            ScrollView(.horizontal) {
                HStack {
                    VStack(alignment: .leading) {
                        ZStack(alignment: .leading) {
                            HStack {
                                Spacer()
                                
                                Image(.dummyMenu)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 140)
                            }
                            VStack {
                                Spacer()
                                
                                HStack {
                                    Text("1")
                                        .textModifier(.theJamsil, 700, 40, "#EFEEDF")
                                }
                            }
                        }
                        .frame(width: 143, height: 155) // TODO: fix hard coding

                        
                        VStack(alignment: .leading) {
                            Text("김밥천국")
                                .textModifier(.pretendard, 600, 14, "#EFEEDF")
                            
                            Text("분식 | 왕십리")
                                .textModifier(.pretendard, 600, 12 ,"#A8A7A1")
                            
                            HStack {
                                Text("816m")
                                    .foregroundStyle(.point)
                                
                                Text("평균 28,000원")
                                    .foregroundStyle(Color(hex:"#A8A7A1"))
                            }
                                .font(.pretendard(.number(600), size: 12))
                        }
                        .padding(.leading, 3)
                    }
                }
            }
        }
    }
}

#Preview {
    RestaurantListRanking()
}
