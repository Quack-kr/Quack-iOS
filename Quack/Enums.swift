//
//  Enums.swift
//  Quack
//
//  Created by 차차 on 1/31/25.
//

import Foundation

/**SignUpView**/
enum SocialMedia: String {
    init() {
        self = .kakao
    }
    case kakao = "카카오"
    case apple = "애플"
    case naver = "네이버"
}

enum NicknameInstructionText: String {
    init() {
        // TODO: InitialView로부터 소셜 로그인 방식 넘겨받기
        self = .normal
    }
    case normal = "꽥에서 사용하실 이름이에요."
    case short = "3지이상 입력해주세요."
    case long = "20자이하로 입력해주세요."
    case used = "사용중인 닉네임입니다."
}
