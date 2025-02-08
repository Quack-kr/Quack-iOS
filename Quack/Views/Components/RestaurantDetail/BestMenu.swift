//
//  BestMenu.swift
//  Quack
//
//  Created by 차차 on 2/8/25.
//

import SwiftUI

struct BestMenu: View {
    var body: some View {
        VStack {
            HStack(alignment: .bottom, spacing: 8) {
                Text("최고의 메뉴")
                    .textModifier(.theJamsil, 700, 18, "#EFEEDF")
                
                Text("최근 3개월간의 의견이에요")
                    .textModifier(.pretendard, 500, 12, "#A8A7A1")
                
                Spacer()
            }
            
            HStack(alignment: .bottom, spacing: 16) {
                ForEach(0 ..< 3) { ind in
                    VStack {
                        ZStack(alignment: .top) {
                            HStack(alignment: .bottom) {
                                VStack(spacing: 0) {
                                    VStack {
                                        Text("2위")
                                        Text("잠봉크림우동")
                                    }
                                    .textModifier(.theJamsil, 700, 14, "#EFEEDF")
                                    .padding(.bottom, 16)
                                    
                                    VStack(spacing: 4){
                                        Circle()
                                            .frame(width: 16)
                                        
                                        Text("맛있어요999+")
                                            .textModifier(.theJamsil, 700, 12, "#D7D5C1")
                                            .padding(.bottom, 16)
                                    }
                                    
                                }
                                .padding(.top, 24)
                                .padding(.horizontal, 16)
                                .background(
                                    RoundedRectangle(cornerRadius: 8)
                                        .foregroundStyle(Color(hex:"#323230"))
                                )
                                .padding(.top, 20)
                            }
                            
                            HStack(alignment: .top) {
                                Circle()
                                    .frame(width: 40)
                                    .foregroundStyle(Color(hex:"#323230"))
                                    .overlay(
                                        
                                        Image(ind == 1 ? .goldCrown : .crown)
                                            .renderingMode(.template)
                                            .foregroundStyle(ind == 1 ? .point : ind == 0 ? .silver : .bronze)
                                    )
                            }
                        }
                        .frame(width: 109)
                        .padding(.bottom, ind == 1 ? 20 : 0)
                    }
                }
            }
            .padding(.top, 24)
        }
        .padding(.horizontal, 16)
        .restaurantDetailComponentBackgroundModifier()
    }
}

#Preview {
        BestMenu()
}
