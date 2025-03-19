//
//  PostService.swift
//  Quack
//
//  Created by 차차 on 2/21/25.
//

import Foundation
import Moya

enum PostService {
    case login(param: LoginRequestParam), logout, initSignIn, signIn(param: SignInRequestParam)
}

extension PostService: TargetType {
    var baseURL: URL { // MARK: Base URL
        // return URL(string: "https://localhost:3000/")! // TODO: Change to the actual server URL
        return URL(string: "https://0e0f-220-85-24-114.ngrok-free.app/")!
    }

    var path: String { // MARK: Endpoints
        switch self {
        case .login:
            return "auth/login/kakao"
        case .logout:
            return "auth/logout/"
        case .initSignIn, .signIn:
            return "registration"
        }
        
    }

    var method: Moya.Method {  // MARK: API http method
        switch self {
        case .login:
            return .post
        case .logout, .initSignIn:
            return .get
        case .signIn:
            return .patch
        }
    }

    var sampleData: Data {
        return Data()
    }

    var task: Task {
        switch self {
        case .login(let param), .signIn(let param):
            return .requestJSONEncodable(param)
        case .logout, .initSignIn:
            return .requestPlain
        }
    }

    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
}
