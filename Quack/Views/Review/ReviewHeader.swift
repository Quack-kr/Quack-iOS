//
//  ReviewHeader.swift
//  Quack
//
//  Created by 차차 on 2/17/25.
//

import SwiftUI

struct ReviewHeader: View {
    var body: some View {
        HStack(alignment: .center, spacing: 8) {
            Image(.chevronLeft)
                .foregroundStyle(Color(hex: "#EFEEDF"))

            Text("리뷰작성")
                .textModifier(.theJamsil, 700, 20, "#EFEEDF")

            Spacer()
        }
    }
}

#Preview {
    ReviewHeader()
}
