//
//  User.swift
//  Quack
//
//  Created by 차승훈 on 3/20/25.
//

import Foundation

struct User: Codable, Identifiable, Equatable {
    // MARK: - Properties

    let id: Int
    let providerId: String
    let providerType: SocialLoginType
    let email: String?
    var nickname: String
    var profileImageUrl: String?
    let createdAt: Date
    var lastLoginAt: Date

    // MARK: - Codable

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

    // MARK: - Initialization

    init(id: Int, providerId: String, providerType: SocialLoginType, email: String?, nickname: String, profileImageUrl: String?, createdAt: Date, lastLoginAt: Date) {
        self.id = id
        self.providerId = providerId
        self.providerType = providerType
        self.email = email
        self.nickname = nickname
        self.profileImageUrl = profileImageUrl
        self.createdAt = createdAt
        self.lastLoginAt = lastLoginAt
    }

    // MARK: - Codable Implementation

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        id = try container.decode(Int.self, forKey: .id)
        providerId = try container.decode(String.self, forKey: .providerId)
        providerType = try container.decode(SocialLoginType.self, forKey: .providerType)
        email = try container.decodeIfPresent(String.self, forKey: .email)
        nickname = try container.decode(String.self, forKey: .nickname)
        profileImageUrl = try container.decodeIfPresent(String.self, forKey: .profileImageUrl)

        // Date 디코딩 처리
        let dateFormatter = ISO8601DateFormatter()

        if let createdAtString = try container.decodeIfPresent(String.self, forKey: .createdAt) {
            createdAt = dateFormatter.date(from: createdAtString) ?? Date()
        } else {
            createdAt = Date()
        }

        if let lastLoginAtString = try container.decodeIfPresent(String.self, forKey: .lastLoginAt) {
            lastLoginAt = dateFormatter.date(from: lastLoginAtString) ?? Date()
        } else {
            lastLoginAt = Date()
        }
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(providerId, forKey: .providerId)
        try container.encode(providerType, forKey: .providerType)
        try container.encodeIfPresent(email, forKey: .email)
        try container.encode(nickname, forKey: .nickname)
        try container.encodeIfPresent(profileImageUrl, forKey: .profileImageUrl)

        // Date 인코딩 처리
        let dateFormatter = ISO8601DateFormatter()
        try container.encode(dateFormatter.string(from: createdAt), forKey: .createdAt)
        try container.encode(dateFormatter.string(from: lastLoginAt), forKey: .lastLoginAt)
    }

    // MARK: - Equatable

    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.id == rhs.id
    }
}
