//
//  MyPageHeader.swift
//  Quack
//
//  Created by 차차 on 2/8/25.
//

import SwiftUI

struct MyPageHeader: View {
    var body: some View {
        HStack {
            Text("마이페이지")
                .textModifier(.theJamsil, 700, 20, "#EFEEDF")
            
            Spacer()
            
            Button(action: {}) {
                Image(.setting)
            }
        }
        .padding(.bottom, 12)
    }
}

#Preview {
    MyPageHeader()
        .background(Color.background)
}
