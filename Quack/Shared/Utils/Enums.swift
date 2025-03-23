//
//  Enums.swift
//  Quack
//
//  Created by 차차 on 1/31/25.
//

import Foundation
import SwiftUI

/**SignUpView**/
enum SocialMediaType: String, Codable {
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

/** ReviewView */
enum RestaurantProsEnum: CaseIterable {
    case taste, side, ingredient, meat, waiting, vibe,
         toilet, parking, service, price

    var text: String {
        switch self {
        case .taste: return "맛이 특별해요"
        case .side: return "사이드메뉴까지 만족해요"
        case .ingredient: return "재료가 신선해요"
        case .meat: return "고기 상태가 좋아요"
        case .waiting: return "웨이팅 인정 맛집이에요"
        case .vibe: return "분위기가 좋아요"
        case .toilet: return "화장실이 깨끗해요"
        case .parking: return "주차하기 좋아요"
        case .service: return "서비스가 좋아요"
        case .price: return "가성비가 진짜 좋아요"
        }
    }

//    var img: ImageResource {
//        switch self {
//        case .taste: return .taste
//        case .side: return .side
//        case .ingredient: return .ingredient
//        case .meat: return .meat
//        case .waiting: return .waiting
//        case .vibe: return .vibe
//        case .toilet: return .toilet
//        case .parking: return .parking
//        case .service: return .service
//        case .price: return .price
//    }
}

enum RestaurantConsEnum: CaseIterable {
    case taste, side, ingredient, noisy, menu, vibe,
         toilet, parking, service, price, long, seat,
         unclean, waiting, meat

    var text: String {
        switch self {
        case .taste: return "맛이 평범해요"
        case .side: return "사이드메뉴가 평범해요"
        case .ingredient: return "재료가 신선하지 않아요"
        case .noisy: return "가계가 시끄러워요"
        case .menu: return "메뉴구성이 아쉬워요"
        case .vibe: return "분위기가 아쉬워요"
        case .toilet: return "화장실이 더러워요"
        case .parking: return "주차가 불편해요"
        case .service: return "서비스가 미흡해요"
        case .price: return "가성비가 좋지 않아요"
        case .long: return "음식이 오래걸려요"
        case .seat: return "좌석이 불편해요"
        case .unclean: return "비위생적이에요"
        case .waiting: return "웨이팅이 길어요"
        case .meat: return "고기 안구워줘요"

        }
    }

//    var img: ImageResource {
//        switch self {
//        case .taste: return
//        case .side: return
//        case .ingredient: return
//        case .noisy: return
//        case .menu: return
//        case .vibe: return
//        case .toilet: return
//        case .parking: return
//        case .service: return
//        case .price: return
//        case .long: return 
//        case .seat: return
//        case .unclean: return
//        case .waiting: return
//        case .meat: return
//    }
}
