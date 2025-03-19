//
//  APIError.swift
//  Quack
//
//  Created by 차승훈 on 3/20/25.
//

import Foundation

enum APIError: Error, LocalizedError {
    case invalidURL(String)
    case invalidResponse
    case decodingFailure(Error)
    case encodingFailure(Error)
    case unauthorized
    case forbidden
    case notFound
    case serverError(Int)
    case networkError(Error)
    case unknownError(Int)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL(let url):
            return "유효하지 않은 URL입니다: \(url)"
        case .invalidResponse:
            return "유효하지 않은 응답입니다."
        case .decodingFailure:
            return "데이터 디코딩 실패"
        case .encodingFailure:
            return "데이터 인코딩 실패"
        case .unauthorized:
            return "인증이 필요합니다. 다시 로그인해주세요."
        case .forbidden:
            return "이 기능에 접근할 권한이 없습니다."
        case .notFound:
            return "요청한 정보를 찾을 수 없습니다."
        case .serverError:
            return "서버 오류가 발생했습니다. 나중에 다시 시도해주세요."
        case .networkError:
            return "네트워크 연결 오류가 발생했습니다."
        case .unknownError:
            return "알 수 없는 오류가 발생했습니다."
        }
    }
}
