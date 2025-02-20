//
//  RestaurantFeature.swift
//  Quack
//
//  Created by 차차 on 2/18/25.
//

import SwiftUI

struct RestaurantFeature: View {
    @State var isSelected: Bool = false
    let imgResource: ImageResource
    let feature: String
    
    var body: some View {
        HStack(spacing: 8) {
            Image(imgResource)
            
            Text(feature)
                .textModifier(.theJamsil, 700, 14, isSelected ? "#EFEEDF" : "#A8A7A1")
        }
        .padding(.vertical, 12)
        .padding(.leading, 12)
        .padding(.trailing, 8)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .foregroundStyle(Color(hex:isSelected ? "#525250" : "#323230"))
        )
        .onTapGesture {
            // TODO: Add Review Manager
            isSelected.toggle()
        }
    }
}

#Preview {
    RestaurantFeature(imgResource: .clock, feature: "맛이 평범해요")
}
