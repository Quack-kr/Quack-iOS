//
//  RestaurantPros.swift
//  Quack
//
//  Created by 차차 on 2/18/25.
//

import SwiftUI

struct RestaurantPros: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text("매장에서 좋았던 점은 없었나요?")
                    .textModifier(.theJamsil, 700, 18, "#EFEEDF")

                Spacer()
            }
            
            ForEach(RestaurantProsEnum.allCases, id: \.self) { pros in
                HStack(spacing: 16) {
                    ForEach(0..<2) { _ in
                        RestaurantFeature(imgResource: .chicken, feature: pros.text)
                    }
                }
            }
        }
    }
}

#Preview {
    RestaurantPros()
}
