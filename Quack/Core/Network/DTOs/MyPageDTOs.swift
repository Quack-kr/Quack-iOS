//
//  MyPageDTOs.swift
//  Quack
//
//  Created by 차차 on 3/23/25.
//

import Foundation

// MARK: - 사용자 프로필
struct UserProfileDTO: Codable {
    let id: Int
    let email: String?
    let nickname: String
    let profileImageUrl: String?
    let socialType: String
    let decibelPoint: Int
    let reviewCount: Int
    let bookmarkCount: Int
}

// MARK: - 리뷰 관리
struct UserReviewDTO: Codable {
    let id: Int
    let restaurantId: Int
    let restaurantName: String
    let restaurantCategory: String
    let content: String
    let reviewType: String
    let imageUrls: [String]?
    let createdAt: String
    let menuTags: [MenuTagDTO]?

    var createdDate: Date? {
        let formatter = ISO8601DateFormatter()
        return formatter.date(from: createdAt)
    }
}

struct MenuTagDTO: Codable {
    let menuId: Int
    let menuName: String
    let tags: [String]
}

struct UserReviewsResponseDTO: Codable {
    let content: [UserReviewDTO]
    let pageable: PageableDTO
    let totalElements: Int
    let totalPages: Int
}

// MARK: - 저장함
struct SavedRestaurantDTO: Codable {
    let id: Int
    let name: String
    let category: String
    let address: String
    let imageUrl: String?
    let distance: Int?
    let averagePrice: Int?
    let isOpen: Bool
    let savedAt: String

    var savedDate: Date? {
        let formatter = ISO8601DateFormatter()
        return formatter.date(from: savedAt)
    }
}

struct SavedRestaurantsResponseDTO: Codable {
    let content: [SavedRestaurantDTO]
    let pageable: PageableDTO
    let totalElements: Int
    let totalPages: Int
}

// MARK: - 문의
struct InquiryDTO: Codable {
    let id: Int
    let title: String
    let content: String
    let status: String
    let imageUrls: [String]?
    let createdAt: String

    var createdDate: Date? {
        let formatter = ISO8601DateFormatter()
        return formatter.date(from: createdAt)
    }
}

struct InquiryDetailDTO: Codable {
    let id: Int
    let title: String
    let content: String
    let status: String
    let imageUrls: [String]?
    let createdAt: String
    let answer: InquiryAnswerDTO?

    var createdDate: Date? {
        let formatter = ISO8601DateFormatter()
        return formatter.date(from: createdAt)
    }
}

struct InquiryAnswerDTO: Codable {
    let content: String
    let createdAt: String

    var createdDate: Date? {
        let formatter = ISO8601DateFormatter()
        return formatter.date(from: createdAt)
    }
}

struct InquiriesResponseDTO: Codable {
    let content: [InquiryDTO]
    let pageable: PageableDTO
    let totalElements: Int
    let totalPages: Int
}

// MARK: - 공통 페이징 DTO
struct PageableDTO: Codable {
    let pageNumber: Int
    let pageSize: Int
}

// MARK: - 응답 래퍼
struct ApiResponseDTO<T: Codable>: Codable {
    let success: Bool
    let data: T?
    let error: ErrorResponseDTO?
}

struct ErrorResponseDTO: Codable {
    let code: String
    let message: String
}
