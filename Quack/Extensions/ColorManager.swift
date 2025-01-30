//
//  ColorManager.swift
//  Quack
//
//  Created by 차차 on 1/13/25.
//

import SwiftUI

extension Color {
    init(hex: String) {
        switch hex {
        case "#EFEEDF":
            self.init(.alabaster)
        case "#D7D5C1":
            self.init(.pastelGray)
        case "#A8A7A1":
            self.init(.quickSilver)
        case "#68675E":
            self.init(.graniteGray)
        case "#525250":
            self.init(.davysGray)
        case "#323230":
            self.init(.darkCharcoal)
        case "#2A2925":
            self.init(.pineTree)
        case "#21211D":
            self.init(.raisinBlack)
        case "#171714":
            self.init(.chineseBlack)
        case "#9A9A9A":
            self.init(.spanishGray)
        default:
            self.init(.clear)
        }
      }
}
