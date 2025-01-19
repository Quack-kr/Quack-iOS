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
        case number(Int)
        
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
            case .number(let num):
                switch num {
                case 400: // Regular
                    return "TheJamsilOTF3Regular"
                case 500: // Medium
                    return "TheJamsilOTF4Medium"
                case 700: // Bold
                    return "TheJamsilOTF5Bold"
                default:
                    return "TheJamsilOTF3Regular"
                }
                
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
        case number(Int)
        
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
            case .number(let num):
                switch num {
                case 400: // Regular
                    return "PretendardVariable-Regular"
                case 500: // Medium
                    return "PretendardVariable-Medium"
                case 600: // Semibold
                    return "PretendardVariable-SemiBold"
                case 700: // Bold
                    return "PretendardVariable-Bold"
                case 800:
                    return "PretendardVariable-ExtraBold"
                default:
                    return "PretendardVariable-Regular"
                }
            }
        }
    }
    
    static func pretendard(_ type: Pretendard, size: CGFloat = 17) -> Font {
        return .custom(type.value, size: size)
    }
}
