//
//  CustomModifier.swift
//  Quack
//
//  Created by 차차 on 2/8/25.
//

import SwiftUI

struct TextModifierWithHexCode:ViewModifier {
    var fontStyle: FontStyle
    var fontWeight:Int
    var fontSize: CGFloat
    var fontColor: String
    
    func body(content: Content) -> some View {
        if fontStyle == .theJamsil {
            content
                .font(.theJamsil(.number(fontWeight), size: fontSize))
                .foregroundStyle(Color(hex:fontColor))
        }
        else if fontStyle == .pretendard {
            content
                .font(.pretendard(.number(fontWeight), size: fontSize))
                .foregroundStyle(Color(hex:fontColor))
        }
    }
}

struct TextModifierWithColor:ViewModifier {
    var fontStyle: FontStyle
    var fontWeight:Int
    var fontSize: CGFloat
    var fontColor: Color
    
    func body(content: Content) -> some View {
        if fontStyle == .theJamsil {
            content
                .font(.theJamsil(.number(fontWeight), size: fontSize))
                .foregroundStyle(fontColor)
        }
        else if fontStyle == .pretendard {
            content
                .font(.pretendard(.number(fontWeight), size: fontSize))
                .foregroundStyle(fontColor)
        }
    }
}

struct SubstractViewButtonModifier: ViewModifier {
    var cornerRadius: CGFloat
    
    func body(content: Content) -> some View {
        content
            .padding(.leading, 12)
            .padding(.trailing, 10.5)
            .padding(.vertical, 8)
            .background(
                Rectangle()
                    .cornerRadius(cornerRadius)
                    .foregroundStyle(Color(hex:"#2A2925"))
                
            )
        
    }
}

struct BlockableButtonTextModifier: ViewModifier {
    @Binding var flag: Bool
    
    func body(content: Content) -> some View {
            content
                .frame(maxWidth: .infinity)
                .textModifier(.pretendard, 700, 16, "#171714")
                .padding(.vertical, 15)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .foregroundStyle(flag ? .point : Color(hex:"#525250"))
                )
    }
}

struct PointColorButtonTextModifier: ViewModifier {
    func body(content: Content) -> some View {
            content
                .frame(maxWidth: .infinity)
                .textModifier(.pretendard, 700, 16, "#171714")
                .padding(.vertical, 15)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .foregroundStyle(.point)
                )
    }
}

struct RestaurantDetailComponentBackgroundModifier: ViewModifier {
    func body(content: Content)-> some View {
        content
            .padding(.top, 32)
            .padding(.bottom, 16)
            .background(Color(hex:"#171714"))
    }
}
