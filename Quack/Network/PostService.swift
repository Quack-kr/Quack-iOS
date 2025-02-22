//
//  PostService.swift
//  Quack
//
//  Created by 차차 on 2/21/25.
//

import Foundation
import Moya

enum PostService {
    case getPost
}

extension PostService: TargetType {
    var baseURL: URL { // MARK: Base URL
        return URL(string: "https://localhost:3000/")!
    }
    
    var path: String { // MARK: Endpoints
        switch self {
        case .getPost:
            return "/posts"
        }
    }
    
    var method: Moya.Method {  // MARK: API http method
        switch self {
        case .getPost:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .getPost:
            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
}
