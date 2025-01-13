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
            self.init(.pastelgray)
        case "#A8A7A1":
            self.init(.quicksilver)
        case "#68675E":
            self.init(.granitegray)
        case "#525250":
            self.init(.davysgray)
        case "#323230":
            self.init(.darkcharcoal)
        case "#2A2925":
            self.init(.pinetree)
        case "#21211D":
            self.init(.raisinblack)
        case "#171714":
            self.init(.chineseblack)
        default:
            self.init(.clear)
        }
      }
}
