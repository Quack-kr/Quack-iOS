//
//  MyPageCSCenter.swift
//  Quack
//
//  Created by 차차 on 2/8/25.
//

import SwiftUI

struct MyPageCSCenter: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("고객센터")
                .textModifier(.theJamsil, 700, 18, "#EFEEDF")
            
            Button(action: {}) {
                HStack {
                    Image(.inquiry)
                    
                    Text("1:1 문의하기")
                        .textModifier(.pretendard, 400, 16, "#EFEEDF")
                    
                    Spacer()
                    
                    Image(.chevronRight)
                }
            }
            
        }
        .textModifier(.pretendard, 400, 16, "#EFEEDF")
        .padding(.vertical, 8)
    }
}

#Preview {
    MyPageCSCenter()
        .background(Color.background)
}
