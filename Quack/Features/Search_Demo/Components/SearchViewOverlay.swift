//
//  HomeViewOverlay.swift
//  Quack
//
//  Created by 차차 on 4/6/25.
//

import SwiftUI

struct SearchViewOverlay: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(.logo)
                    .frame(height: 35)

                Spacer()
            }
            .padding(.leading, 8)

            Spacer()

            VStack {
                Image(.making)

                Text("뚝딱뚝딱 만들고 있어요!")
                    .textModifier(.theJamsil, 700, 16, "#A8A7A1")
            }
            .frame(maxWidth: .infinity)

            Spacer()
        }
        .padding(.horizontal, 16)
        .background(Color.background)
    }
}

#Preview {
    SearchViewOverlay()
}
