//
//  EndPoint.swift
//  Quack
//
//  Created by 차승훈 on 3/20/25.
//

import Foundation

protocol Endpoint {
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String] { get }
    var body: [String: Any]? { get }
    var requiresAuthentication: Bool { get }
}

// 기본 구현 제공
extension Endpoint {
    var headers: [String: String] {
        return [:]
    }
    
    var body: [String: Any]? {
        return nil
    }
    
    var requiresAuthentication: Bool {
        return true
    }
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}
