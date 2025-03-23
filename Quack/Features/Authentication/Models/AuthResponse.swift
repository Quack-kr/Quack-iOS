//
//  AuthResponse.swift
//  Quack
//
//  Created by 차차 on 3/24/25.
//

struct LoginResponse: Codable {
    let jwtAccessToken: String
    let jwtRefreshToken: String
    let isNewUser: Bool
}

struct SignUpResponse: Codable {
    let isRegister: Bool
}
