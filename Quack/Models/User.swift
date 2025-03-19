//
//  User.swift
//  Quack
//
//  Created by 차승훈 on 3/20/25.
//

import Foundation

struct User: Codable, Identifiable, Equatable {
    let id: Int
    let providerId: String
    let providerType: SocialMediaType
    let email: String?
    var nickname: String
    var profileImageUrl: String?
    let createdAt: Date
    var lastLoginAt: Date
    
    // CodingKeys를 명시적으로 정의
    enum CodingKeys: String, CodingKey {
        case id
        case providerId
        case providerType
        case email
        case nickname
        case profileImageUrl
        case createdAt
        case lastLoginAt
    }
    
    // Date 타입의 인코딩/디코딩을 위한 커스텀 로직
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        providerId = try container.decode(String.self, forKey: .providerId)
        providerType = try container.decode.rawValue(SocialMediaType.self, forKey: .providerType)
        email = try container.decodeIfPresent(String.self, forKey: .email)
        nickname = try container.decode(String.self, forKey: .nickname)
        profileImageUrl = try container.decodeIfPresent(String.self, forKey: .profileImageUrl)
        
        // ISO8601 형식의 날짜 문자열을 Date로 변환
        let dateFormatter = ISO8601DateFormatter()
        let createdAtString = try container.decode(String.self, forKey: .createdAt)
        createdAt = dateFormatter.date(from: createdAtString) ?? Date()
        let lastLoginAtString = try container.decode(String.self, forKey: .lastLoginAt)
        lastLoginAt = dateFormatter.date(from: lastLoginAtString) ?? Date()
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(providerId, forKey: .providerId)
        try container.encode(providerType.rawValue, forKey: .providerType)
        try container.encodeIfPresent(email, forKey: .email)
        try container.encode(nickname, forKey: .nickname)
        try container.encodeIfPresent(profileImageUrl, forKey: .profileImageUrl)
        
        // Date를 ISO8601 형식의 문자열로 변환
        let dateFormatter = ISO8601DateFormatter()
        try container.encode(dateFormatter.string(from: createdAt), forKey: .createdAt)
        try container.encode(dateFormatter.string(from: lastLoginAt), forKey: .lastLoginAt)
    }
    
    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.id == rhs.id
    }
}
