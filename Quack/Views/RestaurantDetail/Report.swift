//
//  Report.swift
//  Quack
//
//  Created by 차차 on 2/8/25.
//

import SwiftUI

struct Report: View {
    var body: some View {
        HStack {
            VStack(spacing: 4) {
                Text("잘못된 정보가 있으면")
                    .textModifier(.theJamsil, 700, 18, "#EFEEDF")
                
                Text("꽥에게 말해주세요 언능고칠게요!")
                    .textModifier(.pretendard, 500, 12, "#A8A7A1")
            }
            
            Spacer()
            
            Image(.chevronRight)
        }
        .padding(.top, 23)
        .padding(.bottom, 19)
        .padding(.horizontal, 32)
        .background(Color(hex:"#171714"))
    }
}

#Preview {
    Report()
}
