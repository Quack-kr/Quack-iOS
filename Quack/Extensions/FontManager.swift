//
//  FontManager.swift
//  Quack
//
//  Created by 차차 on 1/12/25.
//

import SwiftUI

extension Font {
    enum TheJamsil {
        case thin
        case light
        case regular
        case medium
        case bold
        case extrabold
        
        var value: String {
            switch self {
            case .thin:
                return "TheJamsilOTF1Thin"
            case .light:
                return "TheJamsilOTF2Light"
            case .regular:
                return "TheJamsilOTF3Regular"
            case .medium:
                return "TheJamsilOTF4Medium"
            case .bold:
                return "TheJamsilOTF5Bold"
            case .extrabold:
                return "TheJamsilOTF6ExtraBold"
            }
        }
    }

    static func theJamsil(_ type: TheJamsil, size: CGFloat = 17) -> Font {
        return .custom(type.value, size: size)
    }
    
    enum Pretendard {
        case regular
        case thin
        case extralight
        case light
        case medium
        case semibold
        case bold
        case extrabold
        case black
        
        var value: String {
            switch self {
            case .regular:
                return "PretendardVariable-Regular"
            case .thin:
                return "PretendardVariable-Thin"
            case .extralight:
                return "PretendardVariable-ExtraLight"
            case .light:
                return "PretendardVariable-Light"
            case .medium:
                return "PretendardVariable-Medium"
            case .semibold:
                return "PretendardVariable-SemiBold"
            case .bold:
                return "PretendardVariable-Bold"
            case .extrabold:
                return "PretendardVariable-ExtraBold"
            case .black:
                return "PretendardVariable-Black"
            }
        }
    }
    
    static func pretendard(_ type: Pretendard, size: CGFloat = 17) -> Font {
        return .custom(type.value, size: size)
    }
}
