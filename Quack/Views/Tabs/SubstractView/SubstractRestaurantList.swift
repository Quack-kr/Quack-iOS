//
//  SubstractRestaurantList.swift
//  Quack
//
//  Created by 차차 on 2/8/25.
//

import SwiftUI

struct SubstractRestaurantList: View {
    var body: some View {
        VStack(spacing: 24) {
            HStack {
                Text("점심에 고기는 헤비해!") // TODO: 문장 동적 변경
                    .textModifier(.theJamsil, 700, 18, "#EFEEDF")
                
                Spacer()
                HStack(spacing: 8) {
                    Button(action: {}) {
                        Text("영업중")
                            .textModifier(.theJamsil, 700, 12, "#A8A7A1")
                            .substractViewButtonModifier(15)
                    }
                    
                    Button(action: {}) {
                        HStack {
                            Text("거리순")
                            
                            Image(.chevronDown)
                        }
                        .textModifier(.theJamsil, 700, 12, "#EFEEDF")
                        .substractViewButtonModifier(15)
                    }
                }
            }
            .padding(.top, 24)
            
            VStack {
                HStack {
                    Image(.dummyThumbnail)
                    
                    VStack {
                        Image(.dummyMenu)
                        
                        Image(.dummyMenu)
                    }
                    
                }
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        Text("김밥천국 분식") // TODO: 카테고리 색상 변경
                            .textModifier(.pretendard, 600, 16, "#EFEEDF")
                        
                        Text("1인 오너 쉐프가 운영하는 합리적인 가격의 가게")
                            .textModifier(.pretendard, 500, 12, "#EFEEDF")
                        
                        Text("816m | 평균 8,000원 | 영업시간 10:00 ~ 23:00") // TODO: 거리 색상 변경
                            .textModifier(.pretendard, 400, 14, "#EFEEDF")
                    }
                    
                    Spacer()
                    
                    Image(.book)
                }
                
            }
            
            Spacer()
        }
        .padding(.horizontal, 16)
        .background(
            Rectangle()
                .foregroundStyle(Color(hex:"#171714"))
                .ignoresSafeArea(edges: .top)
        )
    }
}

#Preview {
    SubstractRestaurantList()
}
