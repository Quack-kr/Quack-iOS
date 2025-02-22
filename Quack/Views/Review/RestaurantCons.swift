//
//  RestaurantCons.swift
//  Quack
//
//  Created by 차차 on 2/18/25.
//

import SwiftUI

struct RestaurantCons: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text("매장에서 불편했던 점은 없었나요?")
                    .textModifier(.theJamsil, 700, 18, "#EFEEDF")

                Spacer()
            }

            ForEach(0 ..< RestaurantConsText.count / 2) { row in
                HStack(spacing: 16) {
                    ForEach(0..<2) { col in
                        RestaurantFeature(imgResource: RestaurantConsImg[row * 2 + col], feature: RestaurantConsText[row * 2 + col])
                    }
                }

                if row == RestaurantConsText.count / 2 - 1 {
                    RestaurantFeature(imgResource: RestaurantConsImg[RestaurantConsText.count - 1], feature: RestaurantConsText[RestaurantConsText.count - 1])
                }
            }
        }
    }
}

#Preview {
    RestaurantCons()
}
