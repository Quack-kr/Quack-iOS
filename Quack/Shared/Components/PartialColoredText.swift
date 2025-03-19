//
//  PartialColoredText.swift
//  Quack
//
//  Created by 차차 on 2/23/25.
//

import SwiftUI

struct PartialColoredText: View {
    let fullText: String
    let targetText: String
    let color: Color

    var body: some View {
        var attributedString = AttributedString(fullText)

        if let range = attributedString.range(of: targetText) {
                    attributedString[range].foregroundColor = color
        }

        return Text(attributedString)
    }
}

#Preview {
    PartialColoredText(fullText: "전체 문장", targetText: "전체", color: .point)
}
