//
//  MenuBlock.swift
//  Quack
//
//  Created by 차차 on 2/17/25.
//

import SwiftUI

struct MenuBlock: View {
    let menuName: String
    let menuPrice: String
    
    @State private var isMenuSelected: Bool = false
    @State private var selected = ""
    
    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            Image(.dummyMenu)
            
            VStack(spacing: 8) {
                Text(menuName)
                    .textModifier(.pretendard, 700, 14, "#EFEEDF")
                
                Text(menuPrice)
                    .textModifier(.pretendard, 500, 14, "#EFEEDF")
            }
            
            Spacer()
            
            Button(action: {
                isMenuSelected.toggle()
            }) {
                Image(.checkCircle)
                    .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                    .foregroundStyle(isMenuSelected ? .point : Color(hex:"#EFEEDF"))
            }
            
        }
    }
}

#Preview {
    MenuBlock(menuName: "자루우동", menuPrice: "10,000원")
        .background(Color.background)
}
