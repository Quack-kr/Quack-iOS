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

            ForEach(0 ..< RESTAURANT_PROS.count / 2) { row in
                HStack(spacing: 16) {
                    ForEach(0..<2) { col in
                        RestaurantFeature(imgResource: RESTAURANT_PROS_IMG[row * 2 + col], feature: RESTAURANT_PROS[row * 2 + col])
                    }
                }
            }
        }
    }
}

#Preview {
    RestaurantPros()
}
