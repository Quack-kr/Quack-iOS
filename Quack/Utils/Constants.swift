//
//  Constants.swift
//  Quack
//
//  Created by 차차 on 1/31/25.
//

import Foundation
import SwiftUI

/** InitialVIew */
let POLICY_TITLE = [
    "서비스 이용약관 동의 (필수)",
    "개인정보 수집 및 이용 동의 (필수)",
    "위치정보 서비스 이용약관 동의 (필수)",
    "마케팅 정보 활용 동의 (선택)"
];

let POLICY_NOTICE = """
                     \'선택\' 항목에 동의하지 않아도 서비스 이용이 가능합니다.
                     개인정보 수집 및 이용에 대한 동의를 거부할 권리가 있으며,
                     동의 거부시 서비스 이용이 제한됩니다.
                     """

let KAKAO_APP_KEY = Bundle.main.infoDictionary?["KakaoAppKey"] as! String

let FOOD_CATEGORY = ["치킨","피자","햄버거","중식","아시안","초밥","국밥","분식","족발","한식","일식","양식"];

/** Restaurant Feature */
let RESTAURANT_CONS = [
    "맛이 평범해요",
    "사이드메뉴가 평범해요",
    "재료가 신선하지 않아요",
    "가게가 시끄러워요",
    "메뉴구성이 아쉬워요",
    "분위기가 아쉬워요",
    "화장실이 더러워요",
    "주차가 불편해요",
    "서비스가 미흡해요",
    "가성비가 좋지 않아요",
    "음식이 오래걸려요",
    "좌석이 불편해요",
    "비위생적이에요",
    "웨이팅이 길어요",
    "고기 안구워줘요"
];

let RESTAURANT_CONS_IMG:[ImageResource] = [.clock, .clock, .clock, .clock, .clock, .clock, .clock, .clock, .clock, .clock, .clock, .clock, .clock, .clock, .clock];

let RESTAURANT_PROS = [
    "맛이 특별해요",
    "사이드메뉴까지 만족해요",
    "재료가 신선해요",
    "고기 상태가 좋아요",
    "웨이팅 인정 맛집이에요",
    "분위기가 좋아요",
    "화장실이 깨끗해요",
    "주차하기 좋아요",
    "서비스가 좋아요",
    "가성비가 진짜 좋아요"
];

let RESTAURANT_PROS_IMG:[ImageResource] = [.clock, .clock, .clock, .clock, .clock, .clock, .clock, .clock, .clock, .clock];
