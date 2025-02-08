//
//  LiveSearchRanking.swift
//  Quack
//
//  Created by 차차 on 2/8/25.
//

import SwiftUI

struct LiveSearchRanking: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("실시간 검색 순위")
                .font(.theJamsil(.number(700), size: 14))
                .foregroundStyle(Color(hex:"#EFEEDF"))
            
            VStack(spacing: 16) {
                HStack(alignment: .center, spacing: 16) {
                    ZStack(alignment:.top) {
                        Image(.dummyMenu)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 64)
                        
                        VStack(alignment: .leading) {
                            Spacer()
                            
                            HStack {
                                Text("1")
                                    .font(.theJamsil(.number(700), size: 30))
                                    .foregroundStyle(Color(hex:"#EFEEDF"))
                                
                                Spacer()
                            }
                        }
                        .frame(width:88, height: 71)
                    }
                    
                    VStack(alignment:.leading, spacing: 4) {
                        HStack {
                            Text("고기천국")
                                .font(.pretendard(.number(600), size: 16))
                                .foregroundStyle(Color(hex:"#D7D5C1"))
                            
                            Text("분식")
                            
                        }
                        Text("1인 오너 쉐프가 운영하는 합리적인 가격의 가게")
                        
                        Text("816m | 평균 8,000원 | 영업중")

                    }
                    .foregroundStyle(Color(hex:"#A8A7A1"))
                    .font(.pretendard(.number(500), size: 12))
                }
            }
        }
    }
}

#Preview {
    LiveSearchRanking()
}
