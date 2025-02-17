//
//  Opinions.swift
//  Quack
//
//  Created by 차차 on 2/8/25.
//

import SwiftUI

struct Opinions: View {
    var body: some View {
        VStack(spacing: 32) {
            ForEach(0 ..< 2) { _ in
                VStack {
                    HStack(alignment: .bottom, spacing: 8) {
                        Text("갈까?")
                            .textModifier(.theJamsil, 700, 18, "#EFEEDF")
                        
                        Text("최근 3개월간의 의견이에요")
                            .textModifier(.pretendard, 500, 12, "#A8A7A1")
                        
                        Spacer()
                    }
                    
                    VStack {
                        
                        ForEach (0..<3) {_ in
                            HStack(spacing: 8) {
                                // Image()
                                
                                Text("가성비가 좋아요")
                                    .textModifier(.theJamsil, 700, 14, "#EFEEDF")
                                
                                Spacer()
                                
                                Text("33")
                                    .textModifier(.pretendard, 700, 12, .point)
                            }
                            .padding(12)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .foregroundStyle(Color(hex:"#323230"))
                            )
                        }
                    }
                }
            }
        }
        .padding(.horizontal, 16)
        .restaurantDetailComponentBackgroundModifier()
    }
}

#Preview {
    Opinions()
}
