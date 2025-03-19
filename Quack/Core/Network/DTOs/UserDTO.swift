//
//  UserDTO.swift
//  Quack
//
//  Created by 차승훈 on 3/20/25.
//

import Foundation

struct UserDTO: Codable {
    let id: Int
    let providerId: String
    let provider: String
    let email: String?
    let nickname: String
    let profileImageUrl: String?
    let createdAt: String
    let lastLoginAt: String
    
    func toDomain() -> User {
        // 날짜 문자열을 Date 객체로 변환하는 포맷터
        let dateFormatter = ISO8601DateFormatter()
        dateFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        
        // 서버에서 받은 날짜 문자열을 Date 객체로 변환
        // 변환 실패 시 현재 날짜를 기본값으로 사용
        let createdDate = dateFormatter.date(from: createdAt) ?? Date()
        let lastLoginDate = dateFormatter.date(from: lastLoginAt) ?? Date()
        
        // 앱 내부에서 사용할 User 모델로 변환
        return User(
            id: id,
            providerId: providerId,
            providerType: SocialMediaType(rawValue: provider) ?? .kakao,
            email: email,
            nickname: nickname,
            profileImageUrl: profileImageUrl,
            createdAt: createdDate,
            lastLoginAt: lastLoginDate
        )
    }
    
    // 필요한 경우, User 모델에서 UserDTO로 변환하는 정적 메서드 추가
    static func fromDomain(_ user: User) -> UserDTO? {
        let dateFormatter = ISO8601DateFormatter()
        dateFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        
        return UserDTO(
            id: user.id,
            providerId: user.providerId,
            provider: user.providerType.rawValue,
            email: user.email,
            nickname: user.nickname,
            profileImageUrl: user.profileImageUrl,
            createdAt: dateFormatter.string(from: user.createdAt),
            lastLoginAt: dateFormatter.string(from: user.lastLoginAt)
        )
    }
}
