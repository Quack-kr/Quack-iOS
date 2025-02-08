//
//  HomeViewBanner.swift
//  Quack
//
//  Created by 차차 on 2/8/25.
//

import SwiftUI

struct HomeBanner: View {
    var body: some View {
        VStack(spacing: 20) {
            /* HomeView Recommand */
            VStack {
                ZStack {
                    Image(.logo)
                        .frame(height: 400)
                    
                    VStack {
                        Spacer()
                        
                        HStack {
                            Spacer()
                            
                            // TODO: 특정 테스트 색상 변경
                            // TODO: 총 갯수 및 현재 위치 동적으로 변경
                            Text("01 / 05")
                                .textModifier(.pretendard, 600, 10, "#A8A7A1")
                                .padding(.horizontal, 8)
                                .padding(.vertical, 2)
                                .background(
                                    RoundedRectangle(cornerRadius: 4)
                                        .foregroundStyle(Color(hex:"#171714"))
                                )
                        }
                        .padding(.trailing, 12)
                        .padding(.bottom, 8)
                        
                    }
                }
                .overlay(
                    // padding 적용이 제대로 되지 않는 현상 -> Image width 제거로 해결
                    // TODO: why?
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color(hex:"#68675E"), lineWidth: 2)
                    
                )
            }
            
            /* HomeView Manual */
            HStack {
                VStack(alignment: .leading) {
                    Text("꽥을 사용하는 방법!")
                        .textModifier(.theJamsil, 700, 18, "#EFEEDF")
                    
                    Text("원하지 않는 음식을 뺴보세요!")
                        .textModifier(.theJamsil, 500, 14, "#EFEEDF")
                }
                .padding(.leading, 16)
                .padding(.vertical, 24.5)
                
                Spacer()
            }
            .background(Color(hex:"#2A2925"))
            .cornerRadius(8)
            
        }
        .padding(.bottom, 8)
    }
}

#Preview {
    HomeBanner()
}
