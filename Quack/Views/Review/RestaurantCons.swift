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

            ForEach(RestaurantConsEnum.allCases, id: \.self) { cons in
                HStack(spacing: 16) {
                    ForEach(0..<2) { _ in
                        RestaurantFeature(imgResource: .chicken, feature: cons.text)
                    }
                }
            }
        }
    }
}

#Preview {
    RestaurantCons()
}
