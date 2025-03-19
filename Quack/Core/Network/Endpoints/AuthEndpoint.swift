//
//  AuthEndpoint.swift
//  Quack
//
//  Created by 차승훈 on 3/20/25.
//

import Foundation

enum AuthEndpoint: Endpoint {
    case socialLogin(provider: String, providerId: String, email: String?)
    case refreshToken
    case logout
    
    var path: String {
        switch self {
        case .socialLogin:
            return "/auth/social-login"
        case .refreshToken:
            return "/auth/refresh"
        case .logout:
            return "/auth/logout"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .socialLogin:
            return .post
        case .refreshToken:
            return .post
        case .logout:
            return .post
        }
    }
    
    var requiresAuthentication: Bool {
        switch self {
        case .socialLogin:
            return false
        case .refreshToken, .logout:
            return true
        }
    }
    
    var body: [String: Any]? {
        switch self {
        case .socialLogin(let provider, let providerId, let email):
            var body: [String: Any] = [
                "provider": provider,
                "providerId": providerId
            ]
            if let email = email {
                body["email"] = email
            }
            return body
        case .refreshToken, .logout:
            return nil
        }
    }
}
