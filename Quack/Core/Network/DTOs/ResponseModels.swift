//
//  ResponseModels.swift
//  Quack
//
//  Created by 차승훈 on 3/20/25.
//

import Foundation

struct APIResponse<T: Codable>: Codable {
    let data: T
    let message: String?
    let status: Int
}

struct PaginatedResponse<T: Codable>: Codable {
    let items: [T]
    let totalItems: Int
    let totalPages: Int
    let currentPage: Int
}
