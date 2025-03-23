//
//  Response.swift
//  Quack
//
//  Created by 차차 on 3/10/25.
//

import Foundation

struct LoginResponse: Codable {
    let accessToken: String
    let refreshToken: String
    let isNewUser: Bool
}

struct SignInInitResponse: Codable {
    let email: String
    let nickname: String
}
