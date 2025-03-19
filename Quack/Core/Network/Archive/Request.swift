//
//  Request.swift
//  Quack
//
//  Created by 차차 on 3/10/25.
//

import Foundation

struct LoginRequestParam: Codable {
    let kakaoAccessToken: String
}

struct SignInRequestParam: Codable {
    let nickname: String
}
