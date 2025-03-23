//
//  OAuthDTO.swift
//  Quack
//
//  Created by 차승훈 on 3/20/25.
//

import Foundation

// MARK: - 사용자 관련 DTO
struct UserDTO: Codable {
    let id: Int
    let email: String
    let nickname: String
    let profileImageUrl: String?
    let socialType: String
}

// MARK: - 로그인 요청 DTO
struct LoginRequestDTO: Codable {
    let accessToken: String
    let socialType: String
}

// MARK: - 로그인 응답 DTO
struct LoginResponseDTO: Codable {
    let user: UserDTO
    let accessToken: String
    let refreshToken: String
}

// MARK: - 에러 DTO
struct ErrorDTO: Codable {
    let code: String
    let message: String
}
