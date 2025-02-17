//
//  Constants.swift
//  Quack
//
//  Created by 차차 on 1/31/25.
//

import Foundation

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
