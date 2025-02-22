//
//  Enums.swift
//  Quack
//
//  Created by 차차 on 1/31/25.
//

import Foundation
import SwiftUI

/**SignUpView**/
enum SocialMediaType: String {
    init() {
        self = .kakao
    }
    case kakao = "카카오"
    case apple = "애플"
    case naver = "네이버"
}

enum NicknameInstructionText: String {
    init() {
        self = .normal
    }
    case normal = "꽥에서 사용하실 이름이에요."
    case short = "3지이상 입력해주세요."
    case long = "20자이하로 입력해주세요."
    case used = "사용중인 닉네임입니다."
}

/** HomeView */
enum CurrentLocation: String, CaseIterable {
    case yongsan = "용산"
    case itaewon = "이태원"
    case hannam = "한남"
    case hongdae = "홍대"
    case hapjung = "합정"
    case yunnam = "연남"
    case mangwon = "망원"
    case sungsu = "성수"
    case gundae = "건대"
    case wangshipri = "왕십리"
    case singdang = "신당"
    case jongro = "종로"
    case yuljiro = "을지로"
    case anguk  = "안국"
    case myungdong = "명동"
    case gangnam = "강남"
    case apgujung = "압구정"
    case jamsil = "잠실"
    case yeouido = "여의도"
    case yungdeungpo = "영등포"
    case munrae = "문래"
}

/** CustomModifier */
enum FontStyle {
    case theJamsil
    case pretendard
}

/** Restaurant */
enum RestaurantCategory {
    case korean, japenese // TODO: Add Case
}

/** SubstractView */
 enum FoodCategory: String, CaseIterable {
    case chicken = "치킨"
    case pizza = "피자"
    case hamburger = "햄버거"
    case chinese = "중식"
    case asian = "아시안"
    case sushi = "초밥"
    case gukbap = "국밥"
    case bunsik = "분식"
    case jokbal = "족발"
    case meat = "고기"
    case korean = "한식"
    case japense = "일식"
    case italian = "이탈리안"
 }
