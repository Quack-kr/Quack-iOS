//
//  ReviewMenu.swift
//  Quack
//
//  Created by 차차 on 2/17/25.
//

import SwiftUI

struct ReviewMenu: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("어떤 메뉴를 도전하셨나요?")
                .textModifier(.theJamsil, 700, 18, "#EFEEDF")
                .padding(.bottom, 16)
            
            ForEach(0..<10) { _ in
                MenuBlock(menuName: "지루우동", menuPrice: "10,000")
            }
        }
    }
}

#Preview {
    ReviewMenu()
}
