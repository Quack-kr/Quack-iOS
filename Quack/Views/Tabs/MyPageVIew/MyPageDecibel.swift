//
//  MyPageDecibel.swift
//  Quack
//
//  Created by 차차 on 2/8/25.
//

import SwiftUI

struct MyPageDecibel: View {
    @Binding var hackGongGam: Double
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            //TODO: 숫자 부분 weight 변경
            Text("핵공감 데시벨 0dB")
                .textModifier(.pretendard, 400, 14, .point)
            
            // TODO: Progress Bar
                ProgressView(value: hackGongGam)
                    .accentColor(.point)
                    .controlSize(.regular)
        }
    }
}

#Preview {
    MyPageDecibel(hackGongGam: .constant(0.2))
        .background(Color.background)
}
