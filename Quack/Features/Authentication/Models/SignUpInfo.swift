//
//  SignUpInfo.swift
//  Quack
//
//  Created by 차차 on 3/24/25.
//

struct SignUpInfo: Codable {
    let socialLoginType: SocialLoginType.RawValue
    let email: String
    let defaultNickname: String
}
