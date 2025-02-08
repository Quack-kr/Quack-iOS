//
//  MyPageLogin.swift
//  Quack
//
//  Created by 차차 on 2/8/25.
//

import SwiftUI

struct MyPageLogin: View {
    @EnvironmentObject private var coordinator: Coordinator<Destination>

    var body: some View {
        Button(action: {
            coordinator.popToRoot()
        }) {
            HStack {
                VStack(alignment: .leading, spacing: 8, content: {
                    Text("로그인/회원가입")
                        .textModifier(.theJamsil, 700, 18, "#EFEEDF")
                        .font(.theJamsil(.number(700), size: 18))
                        .foregroundStyle(Color(hex:"#EFEEDF"))
                    
                    
                    Text("5초만에 로그인하고 꽥을 누려보세요!")
                        .textModifier(.pretendard, 600, 14, "#68675E")
                })
                
                Spacer()
                
                Image(.chevronRight)
            }
        }
    }
}

#Preview {
    MyPageLogin()
        .background(Color.background)
}
