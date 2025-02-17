//
//  CustomModifier.swift
//  Quack
//
//  Created by 차차 on 2/8/25.
//

import SwiftUI

extension View  {
    func textModifier(_ fontStyle: FontStyle, _ fontWeight: Int, _ fontSize: CGFloat, _ fontColor: String) -> some View {
        modifier(TextModifierWithHexCode(fontStyle: fontStyle, fontWeight: fontWeight, fontSize: fontSize, fontColor: fontColor))
    }
    
    func textModifier(_ fontStyle: FontStyle, _ fontWeight: Int, _ fontSize: CGFloat, _ fontColor: Color )-> some View {
        modifier(TextModifierWithColor(fontStyle: fontStyle, fontWeight: fontWeight, fontSize: fontSize, fontColor: fontColor))
    }
    
    func substractViewButtonModifier(_ cornerRadius: CGFloat)-> some View {
        modifier(SubstractViewButtonModifier(cornerRadius: cornerRadius))
    }
    
    func pointColorButtonTextModifier() -> some View {
        modifier(PointColorButtonTextModifier())
    }
    
    func blockableButtonTextModifier(_ flag: Binding<Bool>) -> some View {
        modifier(BlockableButtonTextModifier(flag: flag))
    }
    
    func restaurantDetailComponentBackgroundModifier() -> some View {
        modifier(RestaurantDetailComponentBackgroundModifier())
    }
}
