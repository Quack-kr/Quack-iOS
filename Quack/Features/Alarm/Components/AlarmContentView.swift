//
//  AlarmContentView.swift
//  Quack
//
//  Created by 차차 on 1/30/25.
//

import SwiftUI

struct AlarmContentView: View {
    @Binding var isRoot: Bool
    var alarm: String // TODO: Change Data Type

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading, spacing: 8) {
                Text("[이벤트] 꽥이 소개하는 찐 맛집!!")
                    .font(.pretendard(.number(800), size: 18))
                    .foregroundStyle(Color(hex: "#EFEEDF"))

                Text("2024.10.04")
                    .font(.pretendard(.number(500), size: 14))
                    .foregroundStyle(Color(hex: "#EFEEDF"))
            }

            Divider()
                .background(Color(hex: "#68675E"))

            Image(.dummyThumbnail)
                .resizable()
                .scaledToFit()

            Text(DummyAlarmContent)
            .font(.pretendard(.number(500), size: 12))
            .foregroundStyle(Color(hex: "#EFEEDF"))

            Spacer()
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    AlarmContentView(isRoot: .constant(false), alarm: "")
        .background(Color.background)
}
